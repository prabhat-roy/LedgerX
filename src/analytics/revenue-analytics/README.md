# revenue-analytics

Service in the **analytics** domain of LedgerX.

**Language:** Go · **Port:** 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/revenue-analytics/](../../../helm/charts/revenue-analytics/) — Helm chart
- [manifests/analytics/revenue-analytics/](../../../manifests/analytics/revenue-analytics/) — Raw K8s manifests
