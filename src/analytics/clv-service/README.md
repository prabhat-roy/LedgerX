# clv-service

Service in the **analytics** domain of LedgerX.

**Language:** Go · **Port:** 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clv-service/](../../../helm/charts/clv-service/) — Helm chart
- [manifests/analytics/clv-service/](../../../manifests/analytics/clv-service/) — Raw K8s manifests
