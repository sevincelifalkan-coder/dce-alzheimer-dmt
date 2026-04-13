# DCE Analysis Platform — Alzheimer's DMT Implementation

A simulation-based Discrete Choice Experiment (DCE) framework for evaluating stakeholder preferences in Alzheimer's disease-modifying therapy (DMT) implementation.

## Live Dashboard

**[Launch Dashboard](https://sevinc.shinyapps.io/dce-shiny-app/)**

## About

This platform presents illustrative results from a Monte Carlo simulation calibrated to published clinical trial evidence (CLARITY AD, TRAILBLAZER-ALZ 2), the DCE literature (Dranitsaris et al., 2023), and expert elicitation. No primary data were collected. The framework is designed for adoption by national DMT working groups and HTA bodies.

## Attributes (9 across 3 domains)

### Treatment Characteristics

| Attribute | Type | Levels | Calibration |
|-----------|------|--------|-------------|
| Slowing of Cognitive Decline | Continuous | 0%; 20%; 30%; 40% vs SOC | CLARITY AD, TRAILBLAZER-ALZ 2 |
| ARIA Risk | Continuous | 5%; 10%; 15%; 25% | Lecanemab 12.6%, Donanemab 24% |
| Mode of Administration | Categorical | IV biweekly; IV monthly; SC monthly | Current formulations |
| Treatment Duration | Categorical | 18 months; 3 years; Indefinite | Donanemab stopping rule |

### Implementation Factors

| Attribute | Type | Levels | Calibration |
|-----------|------|--------|-------------|
| Diagnostic Testing | Categorical | PET + genetic; LP + genetic; Blood test | Emerging plasma biomarkers |
| Safety Monitoring | Categorical | Quarterly MRI; 6-monthly; Annual | ARIA monitoring protocols |
| Travel to Treatment | Categorical | Local; Regional; National | Geographic access patterns |
| Waiting Time | Continuous | 1; 3; 6; 12 months | Capacity constraints |

### Cost

| Attribute | Type | Levels | Calibration |
|-----------|------|--------|-------------|
| Annual Cost to Health System | Continuous | EUR 15K; 25K; 35K; 50K | US list price approx. EUR 26,500 |

## Key Finding

Implementation-related attributes collectively account for **42.5%** of total attribute importance, exceeding treatment characteristics alone (35.9%). This suggests that *how* DMTs are delivered matters as much as *what* they deliver.

## Dashboard Modules

1. **Study Design** — Simulation methodology, stakeholder groups, Monte Carlo steps
2. **Attributes & Levels** — Full attribute table with calibration sources, example choice task
3. **Model Results** — Mixed logit coefficients, model fit statistics, relative importance chart
4. **WTP Analysis** — Willingness-to-pay estimates (EUR/year)
5. **Market Simulation** — Interactive Treatment A vs B preference share prediction
6. **Economic Evaluation** — 5-year budget impact projection with adjustable parameters

## Companion Paper

Sen, S.E. (2025). A Simulation-Based Discrete Choice Experiment Framework for Alzheimer's Disease-Modifying Therapy Implementation: Methodology and Interactive Decision Support Tool.

## Related Work

- [Cost-Effectiveness Analysis — Lecanemab & Donanemab (Ireland)](https://sevincelifalkan-coder.github.io/cea-alzheimer-ireland/)
- [AF-PROM Dashboard](https://sevinc.shinyapps.io/af-prom-dashboard/)

## Author

**Sevinc Elif Sen, MSc**
Health Economist | sevincelifalkan@gmail.com

## Licence

(c) 2025-2026 Sevinc Elif Sen. All rights reserved.
This code and accompanying dashboard may be cited and used for academic and policy purposes with appropriate attribution.
