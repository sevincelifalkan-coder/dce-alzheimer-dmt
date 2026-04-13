# DCE Analysis Platform — Alzheimer's DMT Implementation

Simulation-based Discrete Choice Experiment (DCE) framework for evaluating stakeholder preferences in Alzheimer's disease-modifying therapy (DMT) implementation.

## Live Dashboards

- **[Fixed Version — Alzheimer's DMT](https://sevincelifalkan-coder.github.io/dce-alzheimer-dmt/)** (GitHub Pages, redirects to R Shiny)
- **[Dynamic Version — R Shiny with Attribute Editor](https://sevinc.shinyapps.io/dce-dmt-platform/)**

## Overview

Monte Carlo simulation calibrated to published clinical trial evidence (CLARITY AD, TRAILBLAZER-ALZ 2), the DCE literature (Dranitsaris et al., 2023), and expert elicitation. Nine attributes across three domains.

## Attributes

| Domain | Attribute | Type | Levels |
|--------|-----------|------|--------|
| Treatment | Slowing of Cognitive Decline | Continuous | 0%; 20%; 30%; 40% |
| Treatment | ARIA Risk | Continuous | 5%; 10%; 15%; 25% |
| Treatment | Mode of Administration | Categorical | IV biweekly; IV monthly; SC monthly |
| Treatment | Treatment Duration | Categorical | 18 months; 3 years; Indefinite |
| Implementation | Diagnostic Testing | Categorical | PET + genetic; LP + genetic; Blood test |
| Implementation | Safety Monitoring | Categorical | Quarterly MRI; 6-monthly; Annual |
| Implementation | Travel to Treatment | Categorical | Local; Regional; National |
| Implementation | Waiting Time | Continuous | 1; 3; 6; 12 months |
| Cost | Annual Cost to Health System | Continuous | EUR 15K; 25K; 35K; 50K |

## Key Finding

Implementation factors (diagnostics, monitoring, travel, waiting time) collectively account for **42.5%** of total attribute importance, exceeding treatment characteristics alone (35.9%).

## Dashboard Modules

1. **Study Design** — Simulation methodology and stakeholder groups
2. **Attribute Editor** — Add, remove, modify attributes dynamically
3. **Model Results** — Mixed logit coefficients, relative importance
4. **WTP Analysis** — Willingness-to-pay estimates
5. **Market Simulation** — Interactive treatment profile comparison
6. **Economic Evaluation** — 5-year budget impact projection
7. **Upload / Export** — Upload real DCE coefficients via CSV

## Related Work

- [Cost-Effectiveness Analysis — Lecanemab & Donanemab (Ireland)](https://sevincelifalkan-coder.github.io/cea-alzheimer-ireland/)
- [AF-PROM Dashboard](https://sevinc.shinyapps.io/af-prom-dashboard/)
- [Hemodialysis CEA Latvia](https://sevinc.shinyapps.io/hemodialysis-cea-latvia/)

## Author

**Sevinc Elif Sen, MSc**
Health Economist | sevincelifalkan@gmail.com

## Licence

(c) 2025-2026 Sevinc Elif Sen. All rights reserved.
