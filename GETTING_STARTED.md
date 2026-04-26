# Getting Started

> Quickstart for developers joining LedgerX. For the full architecture, read
> [README.md](README.md) and [CLAUDE.md](CLAUDE.md).

---

## Prerequisites

- Docker 24+ and Docker Compose v2
- Make
- Git
- A POSIX shell (bash / zsh)

Language toolchains (install only what you need for the services you'll touch):

| Language | Version | Install |
|---|---|---|
| Go | 1.24+ | <https://go.dev/dl/> |
| Java | 21 | <https://adoptium.net/> |
| Kotlin | 2.x | bundled with Gradle |
| Python | 3.12+ | <https://www.python.org/> |
| Node.js | 22+ | <https://nodejs.org/> |
| Rust | 1.80+ | <https://rustup.rs/> |
| Scala | 3.x | via Coursier |
| Haskell | GHC 9.6+ | via GHCup |
| TypeScript | 5+ | via npm |

Optional but recommended:

- `kind` or `minikube` (local Kubernetes)
- `helm` v3
- `buf` (proto codegen)
- `kubectl` v1.30+
- `cockroach` CLI
- `softhsm2` for local HSM tests

---

## First-time setup

```bash
git clone https://github.com/prabhat-roy/LedgerX.git
cd LedgerX
cp .env.example .env
make bootstrap
make compose-up
docker compose ps
```

---

## Working on a service

Each service lives under `src/<domain>/<service>/` and has its own `Makefile`.

```bash
cd src/<domain>/<service>
make run
make test
```

---

## Money safety

- Never use `float` / `double` for amounts. Use `BigDecimal` (Java/Kotlin),
  `decimal.Decimal` (Go), `rust_decimal::Decimal` (Rust), `Decimal` (Python),
  or `Rational` (Haskell).
- Every monetary write requires an `Idempotency-Key` header (OPA enforces).
- Ledger writes are **append-only** — never UPDATE/DELETE on the journal.

---

## Where things live

| You want… | Look in… |
|---|---|
| Project overview | [README.md](README.md) |
| Architecture and rules for Claude | [CLAUDE.md](CLAUDE.md) |
| Service code | `src/<domain>/<service>/` |
| gRPC schemas | `proto/` |
| Kafka event schemas | `events/` |
| Helm charts | `helm/charts/` |
| Terraform (multi-cloud) | `infra/terraform/{aws,gcp,azure}/` |
| CI pipelines | `ci/` |
| GitOps configs | `gitops/` |
| Observability configs | `observability/` |
| Architecture decisions | `docs/adr/` |
| Operational runbooks | `docs/runbooks/` |

---

## Help

- ADRs in `docs/adr/` capture major architectural decisions.
- Service-level questions: see the README inside the service directory.
- Anything missing: check [CLAUDE.md](CLAUDE.md), or open a PR.
