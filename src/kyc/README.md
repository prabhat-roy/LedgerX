# kyc — LedgerX

KYC, AML, identity verification, FATCA/CRS, screening.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| kyc-service | java | 60100 | KYC workflow orchestrator |
| aml-service | python | 60101 | AML rule + ML scoring |
| document-ocr-service | java | 60102 | Identity document OCR (Passport/National ID/DL) |
| identity-verification | java | 60103 | Liveness + face match identity verification |
| screening-service | java | 60104 | PEP / sanctions screening (OFAC/UN/EU) |
| ubo-service | java | 60105 | Beneficial ownership / UBO discovery |
| cdd-service | java | 60106 | Customer due-diligence tier (CDD/EDD) |
| kyc-refresh-service | java | 60107 | Periodic KYC refresh scheduler |
| onboarding-orchestrator | go | 60108 | Onboarding orchestration (retail+corporate) |
| onboarding-risk-service | java | 60109 | Risk-based onboarding tier scoring |
| fatca-crs-service | java | 60110 | FATCA/CRS tax-residency capture |
| adverse-media-service | java | 60111 | Adverse media + watchlist monitor |
