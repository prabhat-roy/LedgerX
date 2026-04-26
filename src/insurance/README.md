# insurance — LedgerX

Policy admin, claims, reinsurance, IFRS 17, actuarial.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| policy-service | java | 60160 | Policy administration (life/general) |
| claims-service | java | 60161 | Claims management workflow |
| insurance-underwriting | kotlin | 60162 | Insurance underwriting |
| premium-service | java | 60163 | Premium billing + collection |
| ifrs17-engine | haskell | 60164 | IFRS 17 cashflow projection engine |
| reinsurance-service | java | 60165 | Reinsurance ceding service |
| actuarial-service | java | 60166 | Actuarial reserve calculation |
| bancassurance-service | java | 60167 | Bancassurance integration to core banking |
| claims-fraud-service | python | 60168 | Claims fraud detection ML |
| policy-renewal-service | java | 60169 | Policy renewal + lapse prediction |
| beneficiary-service | java | 60170 | Beneficiary management |
| insurance-catalogue | java | 60171 | Insurance product catalogue |
