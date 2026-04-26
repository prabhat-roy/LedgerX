# cash-pooling

Service in the **treasury** domain of LedgerX.

**Language:** Go · **Port:** 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cash-pooling/](../../../helm/charts/cash-pooling/) — Helm chart
- [manifests/treasury/cash-pooling/](../../../manifests/treasury/cash-pooling/) — Raw K8s manifests
