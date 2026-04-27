# ledger-service

Append-only double-entry ledger (event-sourced via EventStoreDB).
Every debit/credit is an immutable event. Balances are projections.
Production deploys require two-person rule approval (`security/opa/policies/two-person-rule.rego`).

Domain: `core-banking` Â· Language: java Â· Port: 60021
