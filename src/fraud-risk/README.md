# fraud-risk — LedgerX

Sub-100ms fraud decisioning, AML graph, ATO detection, case management.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| fraud-detection-service | python | 60120 | Real-time fraud detection (XGBoost via Flink) |
| transaction-monitoring | python | 60121 | Transaction monitoring rules + ML |
| risk-scoring-service | python | 60122 | Customer-level risk scoring |
| case-management-service | kotlin | 60123 | Fraud case management (analyst workflow) |
| fraud-decision-api | go | 60124 | Fraud decision API (sub-100ms) |
| feature-store-service | scala | 60125 | Velocity + behavioural feature service |
| device-trust-service | python | 60126 | Device fingerprinting + bot detection |
| challenge-service | kotlin | 60127 | Step-up auth + challenge orchestration |
| ato-detection-service | python | 60128 | Money-mule / account-takeover detector |
| card-fraud-service | python | 60129 | Card fraud scoring (CNP, geo-anomaly) |
| aml-graph-service | python | 60130 | AML graph (Neo4j + GNN) |
| sanctions-hold-service | kotlin | 60131 | Sanctioned-counterparty hold |
