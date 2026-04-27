# transaction-monitoring

Service in the fraud-risk domain of LedgerX.

Language: Go Â· Port: 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/transaction-monitoring/](../../../helm/charts/transaction-monitoring/) â€” Helm chart
- [manifests/fraud-risk/transaction-monitoring/](../../../manifests/fraud-risk/transaction-monitoring/) â€” Raw K8s manifests
