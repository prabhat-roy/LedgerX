# core-banking — LedgerX

Heart of the bank — accounts, append-only ledger, transactions, balances, EOD.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| account-service | java | 60020 | Customer/business demand-deposit accounts (CockroachDB) |
| ledger-service | java | 60021 | Append-only double-entry ledger (event-sourced) |
| transaction-service | java | 60022 | Authorisation + posting of transactions |
| balance-service | java | 60023 | Real-time balance projections from ledger events |
| interest-service | java | 60024 | Interest accrual posting (uses financial-rules-engine) |
| fee-service | java | 60025 | Fee schedule and posting |
| financial-rules-engine | haskell | 60026 | Pure financial rules engine (interest accrual, IFRS 17 cashflow) |
| statement-service | java | 60027 | Statement generation (PDF/MT940/CAMT) |
| hold-service | java | 60028 | Hold/lien management on accounts |
| standing-instruction-service | java | 60029 | Standing-instructions and recurring transfers |
| eod-service | java | 60030 | End-of-day cutoff and journal close |
| accounting-bridge | kotlin | 60031 | Accounting subledger to GL bridge |

> **Money rule.** Every monetary value is `BigDecimal` (Java/Kotlin). No `double`.
> The ledger is **event-sourced**: writes are append-only, balances are projections.
