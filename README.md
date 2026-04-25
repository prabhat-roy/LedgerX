# LedgerX — Enterprise Financial Services Platform

Enterprise-grade, cloud-native financial services platform built on open source technologies.
Covers the full spectrum of digital banking — retail banking, lending, payments, investment,
insurance, and regulatory compliance — designed for neobanks, fintechs, and digital-first
financial institutions. PCI-DSS, SOC 2 Type II, and ISO 27001 compliant.

---

## Overview

| Attribute         | Value                                                         |
|-------------------|---------------------------------------------------------------|
| Type              | Core Banking + Payments + Lending + Wealth Management         |
| Domains           | 17 business domains                                           |
| Services          | 200+ microservices                                            |
| Languages         | Go, Java, Kotlin, Rust, Python, Scala, Haskell, Node.js       |
| Standards         | ISO 20022, PSD2, SWIFT, FIX Protocol, Open Banking API        |
| Compliance        | PCI-DSS Level 1, SOC 2 Type II, GDPR, ISO 27001, BASEL III   |
| Databases         | PostgreSQL, CockroachDB, Cassandra, Redis, ClickHouse, EventStoreDB |
| Message Broker    | Apache Kafka, NATS JetStream, RabbitMQ                        |
| Cloud             | AWS (primary), GCP                                            |
| Orchestration     | Kubernetes (EKS / GKE) — multi-region active-active           |
| Frontend          | React (customer app), Angular (relationship manager portal), Flutter (mobile banking) |

---

## Business Domains

| # | Domain                  | Key Services                                                         |
|---|-------------------------|----------------------------------------------------------------------|
| 1 | Core Banking            | account-service, ledger-service, transaction-service, balance-service |
| 2 | Payments                | payment-gateway, payment-router, swift-service, sepa-service, upi-service |
| 3 | Cards                   | card-issuance, card-authorization, card-lifecycle, virtual-card       |
| 4 | Lending & Credit        | loan-origination, underwriting, credit-scoring, disbursement, collections |
| 5 | KYC & Onboarding        | kyc-service, aml-service, identity-verification, document-ocr        |
| 6 | Fraud & Risk            | fraud-detection, transaction-monitoring, risk-scoring, case-management |
| 7 | Wealth Management       | portfolio-service, investment-service, robo-advisor, market-data      |
| 8 | Insurance               | policy-service, claims-service, underwriting, premium-service        |
| 9 | Treasury                | fx-service, liquidity-management, cash-pooling, hedging-service       |
| 10 | Compliance & Regulatory | aml-reporting, ctr-service, sar-service, regulatory-reporting        |
| 11 | Open Banking            | consent-service, api-gateway-ob, tpp-registry, psd2-service          |
| 12 | Notifications           | notification-orchestrator, sms-alert, email, push, statement-service  |
| 13 | Customer 360            | customer-profile, relationship-service, crm-integration, segmentation |
| 14 | Analytics & AI          | revenue-analytics, churn-prediction, product-recommendation, clv     |
| 15 | Identity & Access       | auth-service, user-service, mfa-service, session-service, device-trust |
| 16 | Platform                | api-gateway, bff-retail, bff-wealth, graphql-gateway, rate-limiter   |
| 17 | Reconciliation          | reconciliation-service, settlement-service, nostro-reconciliation     |

---

## Architecture

```
               ┌───────────────────────────────────────────┐
               │              API Gateway                   │
               │  (PCI-DSS · OAuth2 · mTLS · Rate Limit)   │
               └──────┬────────────┬───────────────┬────────┘
                      │            │               │
             ┌────────▼──┐  ┌──────▼──────┐  ┌────▼────────────┐
             │ Retail BFF│  │ Wealth BFF  │  │ Open Banking BFF│
             │  (React)  │  │  (Angular)  │  │  (PSD2 / FAPI)  │
             └────────┬──┘  └──────┬──────┘  └────┬────────────┘
                      │            │               │
       ┌──────────────▼────────────▼───────────────▼──────────────┐
       │               Internal gRPC Mesh (Istio mTLS)             │
       │  ┌──────────┐  ┌────────────┐  ┌──────────┐  ┌────────┐  │
       │  │  Core    │  │  Payments  │  │  Lending │  │  Risk  │  │
       │  │ Banking  │  │  & Cards   │  │  & Credit│  │ & Fraud│  │
       │  └──────────┘  └────────────┘  └──────────┘  └────────┘  │
       └──────────────────────┬────────────────────────────────────┘
                              │ Kafka (Financial Events — immutable log)
                    ┌─────────▼──────────────┐
                    │    Event Ledger         │
                    │  (EventStoreDB + Kafka) │
                    └─────────┬──────────────┘
                              │
          ┌───────────────────▼─────────────────────────┐
          │           Financial Analytics               │
          │  ClickHouse · Spark · Airflow · Superset    │
          └─────────────────────────────────────────────┘
```

---

## Tech Stack

### Financial Standards & Protocols
- **ISO 20022**: All payment messages in ISO 20022 XML/JSON (SWIFT migration ready)
- **PSD2 / Open Banking**: FAPI-compliant APIs, dynamic client registration, consent management
- **SWIFT**: SWIFT gpi integration for cross-border payments (MX message format)
- **FIX Protocol**: Market data and order routing for wealth management (QuickFIX/Go)
- **Double-Entry Ledger**: Immutable double-entry accounting ledger (EventStoreDB + event sourcing)

### Infrastructure
- **Kubernetes**: EKS (primary) + GKE — multi-region active-active (us-east-1, eu-west-1)
- **Database**: CockroachDB for geo-distributed ACID transactions (account balances); PostgreSQL (operational)
- **Event Store**: EventStoreDB for event sourcing (all financial transactions are immutable events)
- **Cache**: Redis (session, rate limiting, idempotency keys); Valkey (high-throughput token cache)
- **Service Mesh**: Istio (mTLS mandatory — PCI-DSS requirement for data in transit encryption)

### CI/CD & GitOps
- **CI**: Jenkins (primary), GitHub Actions, GitLab CI, Tekton
- **CD**: ArgoCD (App-of-Apps), Argo Rollouts (blue-green only — financial services cannot canary)
- **IaC**: Terraform (EKS/GKE), Crossplane, Ansible (CIS hardened nodes)
- **Change Management**: Atlantis (Terraform GitOps) + 4-eyes approval for production IaC changes
- **Secrets**: HashiCorp Vault (HSM-backed for payment keys) + AWS KMS

### Observability
- **Metrics**: Prometheus + Thanos + Grafana (SLO: 99.999% for payment processing)
- **Logs**: Loki + Fluent Bit (PCI-DSS: cardholder data never in logs — masked at source)
- **Traces**: Jaeger + OpenTelemetry (trace every payment transaction end-to-end)
- **Fraud Monitoring**: Real-time dashboards on ClickHouse — transaction velocity, geo-anomalies
- **On-call**: Grafana OnCall + PagerDuty (P1 = payment system down → 2-minute response SLA)

### Security (PCI-DSS Level 1)
- **HSM**: AWS CloudHSM for payment card encryption keys (PCI-DSS Req 3)
- **Tokenization**: Card PAN tokenized at point of entry — raw PAN never stored (PCI-DSS Req 3.4)
- **Network Segmentation**: Cardholder Data Environment (CDE) in dedicated VPC with no internet egress
- **Identity**: Keycloak (customer + staff SSO), SPIFFE/SPIRE (service identity), Teleport (privileged access)
- **Scanning**: Trivy, Semgrep (PCI-DSS rule packs), OWASP ZAP, SonarQube, Nessus
- **WAF**: Coraza WAF (OWASP CRS rules) — all public endpoints
- **Policy**: OPA/Gatekeeper (no plaintext secrets in manifests), Kyverno, Falco (runtime)
- **Pen Testing**: Annual third-party penetration test (PCI-DSS Req 11.3) + quarterly ASV scans

### AI / ML (Financial Intelligence)
- **Fraud Detection**: Real-time ML scoring via Apache Flink (sub-50ms latency) — XGBoost model
- **Credit Scoring**: Alternative credit scoring using ML (payment behaviour, transaction patterns)
- **AML Transaction Monitoring**: Graph-based money laundering detection (Neo4j + GNN model)
- **Robo-Advisor**: Portfolio optimization (Python + PyPortfolioOpt + MPT)
- **Churn Prediction**: Survival analysis model for customer churn (Python + lifelines)
- **Spend Analytics**: NLP categorization of transactions (BERT fine-tuned on financial text)

---

## Key Design Decisions

1. **Event sourcing for all financial transactions**: Every debit/credit is an immutable event in EventStoreDB — current balance is a projection, never stored directly
2. **Idempotency on all payment APIs**: Every payment request requires an idempotency key — duplicate requests are safely deduplicated at the payment-gateway level
3. **Blue-green only**: No canary or progressive delivery for payment and ledger services — a partial rollout of a payment bug is catastrophic
4. **CDE isolation**: Cardholder Data Environment runs in a separate VPC with dedicated node pools, network policies, and Falco rules — zero lateral movement possible
5. **Regulatory data residency**: EU customer data stays in eu-west-1 (GDPR Art. 44); US data in us-east-1 — enforced via CockroachDB geo-partitioning
6. **4-eyes principle**: All production configuration changes require approval from two engineers via Atlantis PR workflow

---

## Compliance Controls

| Standard         | Key Controls                                                         |
|------------------|----------------------------------------------------------------------|
| PCI-DSS Req 1    | Cilium eBPF network segmentation, dedicated CDE VPC                  |
| PCI-DSS Req 3    | AWS CloudHSM (key management), card PAN tokenization, AES-256 at rest |
| PCI-DSS Req 6    | Semgrep SAST, OWASP ZAP DAST, SonarQube quality gates in all pipelines |
| PCI-DSS Req 10   | Immutable audit log (Kafka → Elasticsearch), 12-month retention      |
| PCI-DSS Req 11   | Quarterly Nessus scans, annual pen test, Trivy image scanning        |
| SOC 2 Type II    | Automated evidence collection, change management via Atlantis        |
| GDPR             | Consent service, data retention automation, right-to-erasure workflow |
| BASEL III        | Capital adequacy reporting, liquidity risk dashboards on ClickHouse  |

---

## Status

- [ ] Architecture design & double-entry ledger model
- [ ] Service registry & proto definitions
- [ ] ISO 20022 message schemas
- [ ] Service skeletons (healthz, metrics, graceful shutdown)
- [ ] Docker Compose (local dev with synthetic financial data)
- [ ] Helm charts (per-service)
- [ ] CI/CD pipelines
- [ ] GitOps (ArgoCD)
- [ ] PCI-DSS security controls implementation
- [ ] Financial AI/ML services
