# Proto — LedgerX

All cross-service synchronous calls are defined here as `.proto`.
Compile with `buf generate` (config in `buf.yaml` and `buf.gen.yaml`).

## Layout
```
common/         Shared messages (Money, AccountRef, AuditMetadata, IdempotencyKey, ConsentToken)
platform/       Edge: gateway, BFFs, GraphQL, rate-limiter, idempotency, saga
core-banking/   account, ledger, transaction, balance, eod, statement, accounting-bridge
payments/       payment-gateway, router, swift, sepa, upi, ach, rtp
cards/          issuance, authorisation, lifecycle, tokenisation, 3DS, scheme-settlement
lending/        origination, underwriting, scoring, disbursement, collections
kyc/            kyc, aml, ocr, screening, ubo, fatca-crs
fraud-risk/     fraud-detection, transaction-monitoring, risk-scoring, decision-api
wealth/         portfolio, robo-advisor, OMS, market-data, custody
insurance/      policy, claims, premium, ifrs17
treasury/       fx, liquidity, hedging, nostro, alm
compliance/     aml-reporting, regulatory-reporting, lcr, capital-adequacy
open-banking/   consent, ob-gateway, tpp-registry, AIS, PIS, VRP
notifications/  orchestrator, sms, email, push, statement
customer-360/   profile, relationship, segmentation, NBA, CLV
analytics/      revenue, churn, recommendation, profitability
identity/       auth, user, MFA, SSO, device-trust, PAM
reconciliation/ reconciliation, settlement, nostro, scheme, GL
```

## Money rule
Every monetary value uses `common.Money` with a canonical decimal string.
Services MUST parse with `BigDecimal` (Java/Kotlin), `decimal.Decimal` (Go),
`rust_decimal::Decimal` (Rust), or `Decimal` (Python). Never float.

## Idempotency
Every monetary write RPC MUST accept `common.IdempotencyKey`. The OPA policy
`security/opa/policies/idempotency-required.rego` rejects requests without one.
