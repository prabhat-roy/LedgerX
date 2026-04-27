# account-service

Customer/business demand-deposit accounts. CockroachDB â€” multi-region active-active.

Domain: `core-banking` Â· Language: java Â· Port: 60020

Money is `BigDecimal`. Account writes are gated by OPA `idempotency-required.rego`.
