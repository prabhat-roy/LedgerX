# churn-prediction

Service in the analytics domain of LedgerX.

Language: Go Â· Port: 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/churn-prediction/](../../../helm/charts/churn-prediction/) â€” Helm chart
- [manifests/analytics/churn-prediction/](../../../manifests/analytics/churn-prediction/) â€” Raw K8s manifests
