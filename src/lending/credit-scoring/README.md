# credit-scoring

Service in the lending domain of LedgerX.

Language: Go Â· Port: 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/credit-scoring/](../../../helm/charts/credit-scoring/) â€” Helm chart
- [manifests/lending/credit-scoring/](../../../manifests/lending/credit-scoring/) â€” Raw K8s manifests
