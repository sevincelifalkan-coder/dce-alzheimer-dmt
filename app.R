# ────────────────────────────────────────────────────────────────────────────
# DCE Analysis Platform for Disease-Modifying Therapy Implementation
# ────────────────────────────────────────────────────────────────────────────
#
# Author:    Sevinc Elif Sen, MSc
#            Health Economist
#            sevincelifalkan@gmail.com
#
# Purpose:   Generic DCE decision-support platform. Ships with a default
#            Alzheimer's DMT attribute set (9 attributes, 3 domains) but
#            users can define their own attributes, levels, and coefficients
#            for any disease area or healthcare intervention.
#
# Live:      https://sevinc.shinyapps.io/dce-dmt-platform/
#
# Modules:   1. Study Design       - Framework overview
#            2. Attribute Editor    - Add/remove/modify attributes dynamically
#            3. Model Results       - Coefficient estimates, relative importance
#            4. WTP Analysis        - Willingness-to-pay (EUR/year)
#            5. Market Simulation   - Interactive profile comparison (logit)
#            6. Economic Evaluation - 5-year budget impact projection
#            7. Upload / Export     - CSV upload of real coefficients
#
# Tech:      R 4.4 | Shiny | shinydashboard | DT | ggplot2 | plotly
#
# Key design features:
#   - Disease-agnostic: fully customisable attributes, levels, domains
#   - Dual-mode: simulated defaults + real data upload via CSV
#   - Reactive architecture: all downstream outputs update automatically
#   - Zero-code: no programming needed for end users
#   - Preset system: load Alzheimer's DMT default or start blank
#
# Data structure:
#   Attributes stored as list of lists in reactiveValues:
#     - Continuous: id, name, domain, type, unit, levels, labels, coef, se
#     - Categorical: id, name, domain, type, levels, ref, coefs, ses
#   All server outputs (coefficient table, RI chart, WTP, simulation,
#   budget impact) are reactive expressions depending on rv$attrs.
#
# Calibration sources (default preset):
#   - Efficacy/ARIA: CLARITY AD, TRAILBLAZER-ALZ 2, Dranitsaris et al. 2023
#   - Administration: DCE literature on route preferences
#   - Duration: Donanemab stopping rule evidence
#   - Diagnostics: Diagnostic preference literature
#   - Monitoring: ARIA monitoring protocol burden studies
#   - Travel/Access: Geographic access pattern literature
#   - Waiting time: WTP literature for healthcare waiting
#   - Cost: HTA willingness-to-pay thresholds
#
# Licence:   (c) 2025-2026 Sevinc Elif Sen. All rights reserved.
#
# NOTE: Full source code (~830 lines) is available upon request from the
#       author or via the deployed application. This file contains the
#       complete application header and documentation.
#       Contact: sevincelifalkan@gmail.com
#
# Last updated: April 2026
# ────────────────────────────────────────────────────────────────────────────

# To run this application locally:
# 1. Install required packages:
#    install.packages(c("shiny", "shinydashboard", "DT", "ggplot2", "plotly"))
#
# 2. Download the full app.R from the deployed version or request from author
#
# 3. In RStudio: File > Open > app.R > Click "Run App"
#
# 4. To deploy to shinyapps.io:
#    rsconnect::setAccountInfo(name='YOUR_ACCOUNT', token='TOKEN', secret='SECRET')
#    rsconnect::deployApp(getwd())

library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)
library(plotly)

# ── Default Alzheimer's DMT attribute set (9 attributes, 3 domains) ──────

default_attributes <- list(
  list(id="eff",  domain="Treatment", name="Slowing of Cognitive Decline",
       type="continuous", unit="%", levels=c(0,20,30,40),
       labels=c("0%","20%","30%","40%"),
       coef=0.045, se=0.008, source="Dranitsaris et al. 2023"),
  list(id="aria", domain="Treatment", name="ARIA Risk",
       type="continuous", unit="%", levels=c(5,10,15,25),
       labels=c("5%","10%","15%","25%"),
       coef=-0.032, se=0.006, source="Dranitsaris et al. 2023"),
  list(id="admin", domain="Treatment", name="Mode of Administration",
       type="categorical", levels=c("IV biweekly","IV monthly","SC monthly"),
       ref="SC monthly",
       coefs=c(-0.850,-0.420,0), ses=c(0.121,0.109,0), source="DCE literature"),
  list(id="dur", domain="Treatment", name="Treatment Duration",
       type="categorical", levels=c("18 months","3 years","Indefinite"),
       ref="Indefinite",
       coefs=c(0.380,0.120,0), ses=c(0.091,0.082,0), source="Donanemab evidence"),
  list(id="diag", domain="Implementation", name="Diagnostic Testing",
       type="categorical", levels=c("PET + genetic","LP + genetic","Blood test"),
       ref="Blood test",
       coefs=c(-0.650,-0.280,0), ses=c(0.101,0.091,0), source="Diagnostic pref. lit."),
  list(id="mon", domain="Implementation", name="Safety Monitoring",
       type="categorical", levels=c("Quarterly MRI","6-monthly MRI","Annual MRI"),
       ref="Annual MRI",
       coefs=c(-0.480,-0.180,0), ses=c(0.090,0.081,0), source="Monitoring lit."),
  list(id="trav", domain="Implementation", name="Travel to Treatment",
       type="categorical", levels=c("Local","Regional","National"),
       ref="Local",
       coefs=c(0,-0.350,-0.720), ses=c(0,0.079,0.112), source="Access literature"),
  list(id="wait", domain="Implementation", name="Waiting Time",
       type="continuous", unit="months", levels=c(1,3,6,12),
       labels=c("1 mo","3 mo","6 mo","12 mo"),
       coef=-0.058, se=0.009, source="WTP literature"),
  list(id="cost", domain="Cost", name="Annual Cost to Health System",
       type="continuous", unit="EUR", levels=c(15000,25000,35000,50000),
       labels=c("15K","25K","35K","50K"),
       coef=-0.000035, se=0.000006, source="HTA thresholds")
)

default_optout <- -1.250

# ── Utility computation function ─────────────────────────────────────────

compute_profile_utility <- function(attrs, input, prefix) {
  V <- 0
  for (a in attrs) {
    input_id <- paste0("sim_", prefix, "_", a$id)
    val <- input[[input_id]]
    if (is.null(val)) next
    if (a$type == "continuous") {
      V <- V + a$coef * as.numeric(val)
    } else {
      idx <- as.integer(val)
      V <- V + a$coefs[idx]
    }
  }
  V
}

# ── Full application code continues in deployed version ──────────────────
# The complete UI (7 tabs) and server logic (~600 lines) is deployed at:
# https://sevinc.shinyapps.io/dce-dmt-platform/
#
# For the full source code, contact: sevincelifalkan@gmail.com
# ─────────────────────────────────────────────────────────────────────────
