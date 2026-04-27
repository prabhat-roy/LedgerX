# investment-service

Service in the wealth domain of LedgerX.

Language: Go Â· Port: 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/investment-service/](../../../helm/charts/investment-service/) â€” Helm chart
- [manifests/wealth/investment-service/](../../../manifests/wealth/investment-service/) â€” Raw K8s manifests
