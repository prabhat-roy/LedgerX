# credit-scoring

Service in the **lending** domain of LedgerX.

**Language:** Go · **Port:** 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/credit-scoring/](../../../helm/charts/credit-scoring/) — Helm chart
- [manifests/lending/credit-scoring/](../../../manifests/lending/credit-scoring/) — Raw K8s manifests
