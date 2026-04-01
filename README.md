# B2B Churn Prediction — End-to-End MLOps Pipeline

[![Open in Streamlit](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://share.streamlit.io/Avanindra19/churn-prediction-mlops/app/streamlit_app.py)
[![MLflow on DagsHub](https://img.shields.io/badge/MLflow-DagsHub-orange)](https://dagshub.com/Avanindra19/churn-prediction-mlops.mlflow)
[![GitHub Actions](https://github.com/Avanindra19/churn-prediction-mlops/actions/workflows/monthly_pipeline.yml/badge.svg)](https://github.com/Avanindra19/churn-prediction-mlops/actions)

## Overview
A production-style ML pipeline that predicts B2B customer churn,
explains predictions using the Claude AI API, and surfaces
actionable retention recommendations to customer success teams.

Built entirely on cloud platforms — no local installs.

## Architecture
[architecture diagram — added Day 15]

## Tech Stack
| Layer                | Tool                        |
|----------------------|-----------------------------|
| Data warehouse       | Google BigQuery             |
| SQL feature engineering | dbt Cloud               |
| Data + compute       | Kaggle Notebooks            |
| ML model             | XGBoost + scikit-learn      |
| Experiment tracking  | MLflow on DagsHub           |
| AI explanations      | Claude API (Anthropic)      |
| Orchestration        | GitHub Actions              |
| Dashboard            | Streamlit Community Cloud   |
| Version control      | GitHub                      |

## Results
| Metric       | Score  |
|--------------|--------|
| AUC-ROC      | TBD    |
| Precision    | TBD    |
| Recall       | TBD    |

## Live Demo
[Streamlit dashboard link — added Day 14]

## MLflow Experiments
[DagsHub link — added Day 5]

## Project Structure
```
churn-prediction-mlops/
├── notebooks/        # Kaggle notebooks by phase (01, 02, 03)
├── dbt/              # dbt models, tests, documentation
│   ├── models/
│   │   ├── staging/      # Raw source cleaning
│   │   └── features/     # Engineered feature tables
│   └── schema.yml
├── src/              # Reusable Python scripts
├── app/              # Streamlit dashboard
├── outputs/          # Sample model outputs and charts
└── .github/          # GitHub Actions workflow
```

## How to Run
[Added Day 12 after orchestration is complete]

## Author
Avanindra19 · github.com/Avanindra19




