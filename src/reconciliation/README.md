# reconciliation — LedgerX

Real-time and end-of-day reconciliation, settlement, nostro, scheme, GL.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| reconciliation-service | scala | 60320 | Real-time reconciliation (Flink) |
| settlement-service | java | 60321 | Settlement calculation + posting |
| nostro-reconciliation | java | 60322 | Nostro reconciliation (MT940/CAMT) |
| scheme-reconciliation | java | 60323 | Card-scheme settlement reconciliation |
| break-management-service | java | 60324 | Suspense / break management |
| three-way-match | scala | 60325 | Stream-based 3-way match (Flink) |
| gl-reconciliation | java | 60326 | Internal GL reconciliation |
| cash-position-recon | java | 60327 | Cash position reconciliation |
| match-rules-engine | java | 60328 | Auto-match rules engine |
| settlement-instruction-service | java | 60329 | Settlement instruction generator |
