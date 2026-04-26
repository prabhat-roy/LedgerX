# account-service

Customer/business demand-deposit accounts. **CockroachDB** — multi-region active-active.

**Domain:** `core-banking` · **Language:** java · **Port:** 60020

Money is `BigDecimal`. Account writes are gated by OPA `idempotency-required.rego`.
