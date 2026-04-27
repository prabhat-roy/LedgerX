# clv-service

Service in the analytics domain of LedgerX.

Language: Go Â· Port: 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clv-service/](../../../helm/charts/clv-service/) â€” Helm chart
- [manifests/analytics/clv-service/](../../../manifests/analytics/clv-service/) â€” Raw K8s manifests
