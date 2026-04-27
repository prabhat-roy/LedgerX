# market-data

Service in the wealth domain of LedgerX.

Language: Go Â· Port: 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/market-data/](../../../helm/charts/market-data/) â€” Helm chart
- [manifests/wealth/market-data/](../../../manifests/wealth/market-data/) â€” Raw K8s manifests
