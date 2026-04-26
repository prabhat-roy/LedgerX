# customer-360 — LedgerX

Customer profile master, relationship graph, segmentation, NBA, CLV.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| customer-profile-service | java | 60260 | Customer profile master (KYC + product) |
| relationship-service | java | 60261 | Relationship + household graph |
| crm-integration | java | 60262 | CRM integration (Salesforce) |
| segmentation-service | python | 60263 | Behavioural segmentation (k-means + RFM) |
| nba-service | java | 60264 | Next-best-action engine |
| spend-analytics-service | python | 60265 | Spend categorisation (BERT) |
| customer-360-query | java | 60266 | Customer 360 query API |
| clv-service | python | 60267 | Lifetime value (CLV) |
| marketing-consent-service | java | 60268 | Consent + marketing-permission registry |
| hierarchy-service | java | 60269 | Household & corporate hierarchy resolver |
