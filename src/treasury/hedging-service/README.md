# hedging-service

Service in the treasury domain of LedgerX.

Language: Go Â· Port: 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/hedging-service/](../../../helm/charts/hedging-service/) â€” Helm chart
- [manifests/treasury/hedging-service/](../../../manifests/treasury/hedging-service/) â€” Raw K8s manifests
