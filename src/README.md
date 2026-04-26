# Source Code — LedgerX

Backend services organised by business domain. Each domain has its own folder; each
service inside a domain has its own subfolder with a complete project layout
(Dockerfile, Makefile, `.env.example`, language-specific build file, source tree).

## Domains (17)

- [`platform/`](platform/) — gateway, BFFs, GraphQL, rate-limit, idempotency, saga (12)
- [`core-banking/`](core-banking/) — accounts, ledger, balances, EOD, accounting (12)
- [`payments/`](payments/) — gateway, router, SWIFT, SEPA, UPI, ACH, RTP (12)
- [`cards/`](cards/) — issuance, authorisation, lifecycle, virtual, tokenisation (12)
- [`lending/`](lending/) — origination, underwriting, scoring, disbursement, collections (12)
- [`kyc/`](kyc/) — KYC, AML, OCR, screening, FATCA/CRS (12)
- [`fraud-risk/`](fraud-risk/) — detection, monitoring, scoring, AML graph, ATO (12)
- [`wealth/`](wealth/) — portfolio, robo-advisor, market-data, OMS, custody (12)
- [`insurance/`](insurance/) — policy, claims, IFRS 17, reinsurance, actuarial (12)
- [`treasury/`](treasury/) — FX, liquidity, cash pooling, hedging, ALM (12)
- [`compliance/`](compliance/) — AML reporting, BASEL III, MiFID II, EMIR (12)
- [`open-banking/`](open-banking/) — consent, AIS, PIS, FAPI, VRP (12)
- [`notifications/`](notifications/) — orchestrator, SMS, email, push, IVR (10)
- [`customer-360/`](customer-360/) — profile, relationship, segmentation, CLV (10)
- [`analytics/`](analytics/) — revenue, churn, recommendation, profitability (10)
- [`identity/`](identity/) — auth, MFA, SSO, device-trust, PAM, SPIFFE (12)
- [`reconciliation/`](reconciliation/) — settlement, nostro, scheme recon (10)

Total: **199 services**.

## Conventions

- One folder per service; one main entry file per language (`main.go`, `Application.java`, `main.py`, `main.rs`, `Main.scala`, `Main.hs`, etc.)
- Every service exposes `/healthz` returning `{ "status": "ok" }`
- Every service ships a `Dockerfile` (multi-stage, non-root, minimal base) and a `Makefile`
- gRPC contracts live in [`../proto/<domain>/<service>.proto`](../proto/)
- Kafka schemas live in [`../events/`](../events/)

## Languages used

- **Go** (1.24): payment-router/gateway/BFFs, high-throughput stateless services
- **Java 21 / Spring Boot 3.3**: core-banking ledger, accounting, regulatory reporting
- **Kotlin / Spring Boot 3.3**: lending, treasury, underwriting
- **Rust 1.80 / Actix**: cryptographic services, card issuance, HSM-adjacent code
- **Python 3.12 / FastAPI**: fraud ML, churn, robo-advisor, AML scoring
- **Scala 3 / Akka**: stream processing on Kafka (Flink) for fraud and reconciliation
- **Haskell / GHC 9.6**: pure financial-rules engine (interest accrual, IFRS 17 cashflow)
- **Node.js 22 / Fastify**: notification orchestration, customer messaging

## Money rule

No service uses `float` / `double` for monetary amounts. Use:

| Language | Type |
|---|---|
| Java/Kotlin | `java.math.BigDecimal` |
| Go | `github.com/shopspring/decimal.Decimal` |
| Rust | `rust_decimal::Decimal` |
| Python | `decimal.Decimal` |
| Haskell | `Data.Ratio.Rational` (or `Decimal` package) |
