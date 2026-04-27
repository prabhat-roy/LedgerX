# case-management

Service in the fraud-risk domain of LedgerX.

Language: Go Â· Port: 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/case-management/](../../../helm/charts/case-management/) â€” Helm chart
- [manifests/fraud-risk/case-management/](../../../manifests/fraud-risk/case-management/) â€” Raw K8s manifests
