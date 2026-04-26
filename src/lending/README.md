# lending — LedgerX

Loan origination, underwriting, scoring, disbursement, collections.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| loan-origination | kotlin | 60080 | Loan origination workflow (retail/SME/mortgage) |
| underwriting-service | kotlin | 60081 | Underwriting orchestrator |
| credit-scoring-service | python | 60082 | ML credit scoring (alternative + bureau data) |
| disbursement-service | kotlin | 60083 | Loan disbursement + ledger booking |
| repayment-service | kotlin | 60084 | Repayment scheduling + collection |
| collections-service | kotlin | 60085 | Collections workflow (delinquency buckets) |
| restructure-service | kotlin | 60086 | Loan restructuring + moratorium |
| collateral-service | kotlin | 60087 | Collateral management (PostGIS for property) |
| loan-booking-service | kotlin | 60088 | Loan booking on the ledger |
| amortisation-engine | haskell | 60089 | Pure interest/amortisation calculator |
| bureau-connector | kotlin | 60090 | Bureau (Experian/Equifax/TransUnion/CIBIL) integration |
| writeoff-service | kotlin | 60091 | Loan write-off and provisioning |
