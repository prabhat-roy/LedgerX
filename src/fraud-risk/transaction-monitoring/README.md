# transaction-monitoring

Service in the **fraud-risk** domain of LedgerX.

**Language:** Go · **Port:** 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/transaction-monitoring/](../../../helm/charts/transaction-monitoring/) — Helm chart
- [manifests/fraud-risk/transaction-monitoring/](../../../manifests/fraud-risk/transaction-monitoring/) — Raw K8s manifests
