# analytics — LedgerX

Revenue, churn, recommendation, profitability — ClickHouse-backed.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| revenue-analytics | python | 60280 | Revenue analytics service (ClickHouse) |
| churn-prediction-service | python | 60281 | Churn prediction (lifelines survival) |
| product-recommendation-service | python | 60282 | Product recommendation (matrix factorisation) |
| profitability-service | python | 60283 | Profitability (FTP + ABC costing) |
| cohort-service | python | 60284 | Cohort segmentation pipeline |
| attribution-service | python | 60285 | Marketing attribution |
| pricing-optimisation | python | 60286 | Pricing optimisation ML |
| bi-bridge-service | python | 60287 | Self-serve BI + Superset bridge |
| kpi-anomaly-service | python | 60288 | Anomaly detection on KPIs |
| embedded-analytics-api | python | 60289 | Embedded analytics API |
