# B2B Churn Prediction — End-to-End MLOps Pipeline

[![Open in Streamlit](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://share.streamlit.io/Avanindra19/churn-prediction-mlops/app/streamlit_app.py)
[![MLflow on DagsHub](https://img.shields.io/badge/MLflow-DagsHub-orange)](https://dagshub.com/Avanindra19/churn-prediction-mlops.mlflow)
[![GitHub Actions](https://github.com/Avanindra19/churn-prediction-mlops/actions/workflows/monthly_pipeline.yml/badge.svg)](https://github.com/Avanindra19/churn-prediction-mlops/actions)

## Overview
A production-style ML pipeline that predicts B2B customer churn,
explains predictions using the Claude AI API, and surfaces
actionable retention recommendations to customer success teams.

## Architecture
[architecture diagram]

## Tech Stack
| Layer             | Tool                        |
|-------------------|-----------------------------|
| Data + compute    | Kaggle Notebooks            |
| SQL features      | Python sqlite3              |
| ML model          | XGBoost + scikit-learn      |
| Experiment tracking | MLflow on DagsHub         |
| AI explanations   | Claude API (Anthropic)      |
| Orchestration     | GitHub Actions              |
| Dashboard         | Streamlit Community Cloud   |
| Version control   | GitHub                      |

## Results
| Metric       | Score  |
|--------------|--------|
| AUC-ROC      | TBD    |
| Precision    | TBD    |
| Recall       | TBD    |

## Live Demo
[Streamlit dashboard link]

## MLflow Experiments
[DagsHub link]

## Project Structure
notebooks/   — Kaggle notebooks by phase (01, 02, 03)
src/         — Reusable Python scripts
app/         — Streamlit dashboard
outputs/     — Sample model outputs and charts
.github/     — GitHub Actions workflow

## How to Run


## Author
Avanindra19 · github.com/Avanindra19




