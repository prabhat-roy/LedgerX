# risk-scoring

Service in the **fraud-risk** domain of LedgerX.

**Language:** Go · **Port:** 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/risk-scoring/](../../../helm/charts/risk-scoring/) — Helm chart
- [manifests/fraud-risk/risk-scoring/](../../../manifests/fraud-risk/risk-scoring/) — Raw K8s manifests
