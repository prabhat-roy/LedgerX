# open-banking — LedgerX

PSD2 / Open Banking — consent, AIS, PIS, FAPI 2.0, VRP.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| consent-service | go | 60220 | PSD2 consent management (CIBA + redirect) |
| ob-gateway | go | 60221 | Open Banking API gateway (FAPI) |
| tpp-registry | go | 60222 | TPP registration and dynamic client |
| psd2-service | go | 60223 | PSD2 AISP/PISP service |
| ais-service | go | 60224 | Account information service (AIS) |
| pis-service | go | 60225 | Payment initiation service (PIS) |
| funds-confirmation-service | go | 60226 | Funds confirmation service (CBPII) |
| fapi-token-service | go | 60227 | FAPI 2.0 token endpoint |
| jws-verifier | go | 60228 | JWS / detached-signature verifier |
| vrp-service | go | 60229 | Variable Recurring Payments (VRP) |
| open-finance-investment | go | 60230 | Open Finance investment data |
| premium-api-catalogue | go | 60231 | Premium API (data product) catalogue |
