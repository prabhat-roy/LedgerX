# churn-prediction

Service in the **analytics** domain of LedgerX.

**Language:** Go · **Port:** 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/churn-prediction/](../../../helm/charts/churn-prediction/) — Helm chart
- [manifests/analytics/churn-prediction/](../../../manifests/analytics/churn-prediction/) — Raw K8s manifests
