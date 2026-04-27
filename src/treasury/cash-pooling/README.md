# cash-pooling

Service in the treasury domain of LedgerX.

Language: Go Â· Port: 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cash-pooling/](../../../helm/charts/cash-pooling/) â€” Helm chart
- [manifests/treasury/cash-pooling/](../../../manifests/treasury/cash-pooling/) â€” Raw K8s manifests
