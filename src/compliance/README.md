# compliance — LedgerX

Regulatory reporting (BASEL III / MiFID II / EMIR), AML, FATCA/CRS, GDPR.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| aml-reporting-service | java | 60200 | AML reporting (SAR/STR generation) |
| ctr-service | java | 60201 | CTR (cash transaction reporting) |
| sar-service | java | 60202 | SAR (suspicious activity reporting) |
| regulatory-reporting | java | 60203 | Regulatory reporting (BASEL III, COREP/FINREP) |
| tax-reporting-service | java | 60204 | Tax reporting (1099, FATCA, CRS) |
| capital-adequacy-service | java | 60205 | Capital adequacy reporting |
| lcr-service | java | 60206 | Liquidity coverage ratio reporting |
| trade-reporting-service | java | 60207 | Trade reporting (MiFID II, EMIR) |
| data-subject-service | java | 60208 | GDPR right-to-erasure orchestrator |
| compliance-dashboard | java | 60209 | Audit-trail compliance dashboard |
| regulator-gateway | java | 60210 | Regulator submission gateway (SFTP/MQ) |
| control-attestation | java | 60211 | Policy + control attestation |
