# risk-scoring

Service in the fraud-risk domain of LedgerX.

Language: Go Â· Port: 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/risk-scoring/](../../../helm/charts/risk-scoring/) â€” Helm chart
- [manifests/fraud-risk/risk-scoring/](../../../manifests/fraud-risk/risk-scoring/) â€” Raw K8s manifests
