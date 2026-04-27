# AI_PLAN.md â€” LedgerX (Banking, Capital Markets & Wealth Platform)

> Hierarchical AI/ML strategy. Reuses the Paperclip / OpenClaw / NemoClaw
> agent platform first defined in [ShopOS/AI.md](../ShopOS/AI.md). This file
> is the LedgerX-specific specialisation.

---

## 1. Why AI in LedgerX

Financial services live or die on three AI surfaces: fraud + AML,
credit decisioning, and markets analytics. LedgerX adds two more
that have moved from nice-to-have to table-stakes:

- Conversational client experience â€” robo-advisor, chatbots â€” across
  retail, premier, and SME segments.
- Regulatory-reporting NLP â€” the volume of MAR / MiFID II / SEBI /
  FATF rule updates is now beyond manual tracking.

Every AI surface is explainable (SHAP / LIME for credit + AML),
auditable (immutable trace), and adversary-resistant (model
hardening + drift + adversarial input detection).

---

## 2. Domain-Specific AI/ML Use Cases

| # | Use case | Domain | Model class | Latency budget |
|---|----------|--------|-------------|----------------|
| 1 | Real-time card / payment fraud detection | payments | XGBoost + GraphSAGE on transaction graph | <50 ms |
| 2 | AML transaction monitoring + smurfing detection | aml, compliance | GraphNN (PyG) + Isolation Forest + LLM SAR drafting | nightly + intraday |
| 3 | Credit-score (retail + SME) | lending | LightGBM + monotonic constraints + SHAP | <300 ms |
| 4 | Robo-advisor / portfolio recommender | wealth | RL on multi-asset + LLM rationale | <1 s |
| 5 | Market sentiment from news + social | trading, research | FinBERT + Llama 3.1 70B + dedup | streaming |
| 6 | Customer-service chatbot (retail + premier) | crm, support | Llama 3.1 70B + RAG over T&Cs | <1.5 s |
| 7 | Regulatory-reporting NLP (MAR, MiFID II, SEBI, FATCA) | reg-reporting | Llama 3.1 70B + KG + extractor | nightly |
| 8 | KYC document AI (passport, utility bill, PAN, Aadhaar) | onboarding, compliance | Donut + LayoutLMv3 + face match | <3 s |
| 9 | Insider-threat / trader-surveillance | compliance | E-comms NLP + behaviour features + GBM | streaming |
| 10 | Cash / liquidity forecasting | treasury | NHITS + Temporal Fusion Transformer | hourly |
| 11 | Credit-card collections optimisation | collections | Uplift modelling + LLM call-script gen | nightly |
| 12 | Anomaly detection on settlement / nostro reconciliations | back-office | Autoencoder + rules | streaming |

---

## 3. Hierarchical Agent Architecture

Reuses OpenClaw / Paperclip / NemoClaw from `ShopOS/AI.md`.

### Tier 0 â€” Master Architect Agent

`ledger-architect` â€” researches AI tooling, proposes services, on-boards
Tier-1 leads, weekly written report. Read-only on prod.

### Tier 1 â€” Division Leads (5)

| Agent | Scope |
|-------|-------|
| `ledger-dev-lead`        | Backend/frontend service code |
| `ledger-devops-lead`     | Helm, GitOps, infra, CI |
| `ledger-devsecops-lead`  | OPA, Vault, Cilium, Falco, PCI-DSS, SOX, ISO 27001 |
| `ledger-dataml-lead`     | Feature store, training, drift, model risk |
| `ledger-platform-lead`   | Cross-cutting (idempotency, saga, outbox) |

### Tier 2 â€” Specialist Agents

By language: Go, Java, Kotlin, Python, Node, Rust, Scala (markets),
TypeScript.

By tool: PostgreSQL, Oracle (legacy bridges), MongoDB, Redis,
Elasticsearch, ClickHouse, Cassandra, Kafka, NATS, RabbitMQ, IBM MQ
bridge, Vault, Keycloak, OPA, Kyverno, Falco, Cilium, Istio, ArgoCD,
Argo Workflows, Prometheus, Grafana, Loki, Jaeger, OpenTelemetry,
MinIO, Trivy, Cosign, OpenSearch, Pulsar, Druid, Camunda, OpenFGA,
Wazuh, HyperLedger Fabric (settlement bridge), Cardano Atala
(KYC bridge, optional), Apache Flink (streaming), Apache Pinot.

By service â€” one agent per microservice (~210). Owns README,
OpenAPI, tests, CHANGELOG, deps, /healthz.

### Tier 3 â€” Ephemeral Workers

Spawned for retraining a fraud model on the latest week's labels,
generating SAR drafts, building risk-model documentation packets.

### Lifecycle

Research â†’ Document â†’ Implement â†’ Test â†’ Review â†’ Deploy â†’ Monitor â†’
Respond â†’ Upgrade â†’ Report. Plus a model-risk-management (MRM) gate
per SR 11-7 / PRA SS1/23: every credit / AML model has independent
challenger validation before prod.

---

## 4. Separate AI Infrastructure

```
ai-platform/
â”œâ”€â”€ cluster: ledger-ai-{aws,gcp,azure}    â† cloud GPU pool, PCI-DSS-segmented
â”œâ”€â”€ namespace: ledger-ai-control           â† Paperclip
â”œâ”€â”€ namespace: ledger-ai-agents            â† OpenClaw runtime
â”œâ”€â”€ namespace: ledger-ai-sandbox           â† NemoClaw â€” strict financial guardrails
â”œâ”€â”€ namespace: ledger-ai-models            â† vLLM, Ollama, LiteLLM, Triton
â”œâ”€â”€ namespace: ledger-ai-data              â† Qdrant, Weaviate, MinIO, MLflow, Feast
â”œâ”€â”€ namespace: ledger-ai-obs               â† Langfuse, Phoenix
â””â”€â”€ namespace: ledger-ai-pipelines         â† Argo Workflows + Kubeflow
```

### Hardware

- Cloud: A100 for training (graph + GBM + LLM fine-tunes); A10G/L4
  for inference.
- All clouds in regions accepting PCI-DSS, SOC 2, ISO 27001 attestations.

### Software stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Cloud inference | vLLM, Triton | LLM + vision |
| Local dev | Ollama | Offline / dev |
| Gateway | LiteLLM | OpenAI-compatible, quota, audit |
| Orchestrator | Paperclip | Task queue, audit |
| Agent platform | OpenClaw | Llama 3.1 70B |
| Sandbox | NemoClaw | NeMo Guardrails â€” financial-safe |
| Vector | Qdrant | T&C / regulatory RAG |
| Vector | Weaviate | Multimodal (KYC docs + face) |
| MLOps | MLflow | Model registry, MRM provenance |
| Pipelines | Kubeflow Pipelines | Reproducible training |
| Workflows | Argo Workflows | Eval, retraining, batch |
| Feature store | Feast | Customer + transaction features |
| Drift | Evidently + Whylogs | Drift, calibration, fairness |
| Streaming | Flink + Kafka | Real-time fraud features |
| LLM obs | Langfuse + Phoenix | Trace, cost, eval, audit |

### Data isolation

- PCI cardholder data tokenised before any feature pipeline.
- Customer PII: regional sharding (EU / UK / US / IN / SG).
- Vector DB sharded per LE (legal entity); no cross-LE retrieval.
- Every prompt + completion â†’ Langfuse + Paperclip with customer-ID hashed.

---

## 5. Compliance & Guardrails

| Control | Mechanism |
|---------|-----------|
| PCI-DSS 4.0 | Cardholder data tokenised; AI never sees PAN |
| SOX | All change PRs from agents reviewed by humans; CI logs immutable |
| GDPR / CCPA / DPDP | PII tokenisation; right-to-erasure |
| Basel / IFRS 9 | Credit / IFRS9 ECL models version-controlled; back-tests automated |
| MAR / MiFID II / SEBI | Surveillance models tied to alerts; alerts immutable |
| FATF / OFAC / EU AML | AML model decisions feed SAR drafts; humans always file |
| SR 11-7 / PRA SS1/23 (Model Risk) | Every model has model card + independent validation + monitoring |
| Fair lending (ECOA, FCA) | Quarterly bias audit on credit models; disparate-impact metrics tracked |
| NemoClaw financial policy | Blocks LLM giving binding investment advice; only generates rationale for human-approved recommendations |

---

## 6. Implementation Roadmap

| Month | Milestone |
|-------|-----------|
| 1 | `ledger-ai-*` PCI-segmented cluster up; vLLM Llama 3.1 70B |
| 2 | Paperclip + NemoClaw financial policies; Tier-0 architect live |
| 3 | Tier-1 leads; fraud model v0 in shadow on streaming |
| 4 | Per-language / per-tool Tier-2 agents |
| 5 | Per-service Tier-2 agents (payments â†’ cards â†’ aml first) |
| 6 | Fraud v1 prod (50 ms p95); AML graphNN v1 nightly |
| 7 | Robo-advisor pilot; reg-reporting NLP for MAR + MiFID II |
| 8 | Credit v1 prod with MRM sign-off; multi-cloud failover drill |

---

## 7. Cost Envelope (target)

- Cloud infra: $7,500 â€“ $11,000 / month per primary cloud (PCI premium)
- No subscription LLM spend
- MRM tooling: $0 (self-hosted MLflow + Whylogs + Evidently)

---

## 8. Cross-References

- Master AI strategy: [ShopOS/AI.md](../ShopOS/AI.md)
- Same Paperclip/OpenClaw/NemoClaw platform across all 15 sibling projects.
