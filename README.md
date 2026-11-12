# Visitor Purchase Prediction with BigQuery ML

A hands-on Google Cloud Skills Boost lab demonstrating how to build, evaluate, and use a binary classification model with **BigQuery ML** and **SQL**.

> **Learning project:** This repository documents the lab *Getting Started with BigQuery ML*. It is a learning exercise based on Google's public Google Analytics sample dataset, not an independently collected dataset or a production-ready purchase prediction system.

## Lab achievement

- Google Cloud Skills Boost score: **100/100**
- Platform: Google Cloud BigQuery
- ML technique: Binary logistic regression
- Model: `bqml_lab.sample_model`
- Data source: `bigquery-public-data.google_analytics_sample.ga_sessions_*`

## Objective

Predict whether a Google Merchandise Store visitor will make a transaction using session-level features:

- Operating system
- Whether the visitor is using a mobile device
- Visitor's country
- Number of page views

The target label is `1` when a transaction exists and `0` otherwise.

## Repository structure

```text
.
├── README.md
└── sql/
    ├── 01_create_model.sql
    ├── 02_evaluate_model.sql
    ├── 03_predict_purchases_by_country.sql
    └── 04_predict_purchases_by_user.sql
```

## How to run

1. Open the [Google Cloud Console](https://console.cloud.google.com/) using a Google Cloud project with BigQuery access.
2. Open BigQuery Studio.
3. Create a dataset named `bqml_lab` in the **US** location.
4. Open each SQL file in `sql/` and run them in numerical order.
5. The model creation query trains the model; the remaining queries evaluate it and generate predictions.

The lab uses Google's public sample dataset. BigQuery access, permissions, and any applicable billing/quota settings are controlled by the Google Cloud project you run it in. If you are completing the Skills Boost lab, use its temporary student project and credentials as instructed by the lab.

## SQL workflow

1. **Train:** `CREATE OR REPLACE MODEL` creates a logistic regression model.
2. **Evaluate:** `ML.EVALUATE` calculates classification metrics such as precision, recall, accuracy, F1 score, log loss, and ROC AUC.
3. **Predict by country:** `ML.PREDICT` generates predictions, which are aggregated by country.
4. **Predict by visitor:** `ML.PREDICT` generates predictions, which are aggregated by `fullVisitorId`.

## Evaluation notes

In my completed lab run, BigQuery returned approximately:

| Metric | Result |
|---|---:|
| Precision | 0.4407 |
| Recall | 0.0726 |
| Accuracy | 0.9853 |
| F1 score | 0.1247 |
| Log loss | 0.0481 |

The ROC AUC value was visible only partially in the captured results, so it is intentionally not transcribed here.

**Interpretation:** Accuracy is high, but recall is low. This means the model correctly classifies many sessions overall, while identifying only a small proportion of actual purchasing sessions. Because purchases are relatively uncommon, accuracy should not be considered on its own.

The country and visitor prediction queries return model-generated predictions, not verified future purchases.

## Skills demonstrated

- SQL querying in BigQuery
- Creating datasets and BigQuery ML models
- Binary classification with logistic regression
- Model evaluation and interpretation
- Applying a trained model with `ML.PREDICT`
- Aggregating predictions with `GROUP BY`, `SUM`, and `ORDER BY`

## References

- [BigQuery ML documentation](https://cloud.google.com/bigquery/docs/bqml-introduction)
- [BigQuery ML model evaluation](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-evaluate)
- [BigQuery ML predictions](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-predict)
- [Google Cloud Skills Boost](https://www.cloudskillsboost.google/)

## Acknowledgement

Completed as part of Google Cloud Skills Boost learning. The lab uses Google's public Google Analytics sample data and follows the lab's guided exercise.
