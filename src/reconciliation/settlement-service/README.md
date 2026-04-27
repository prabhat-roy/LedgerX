# settlement-service

Service in the reconciliation domain of LedgerX.

Language: Go Â· Port: 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/settlement-service/](../../../helm/charts/settlement-service/) â€” Helm chart
- [manifests/reconciliation/settlement-service/](../../../manifests/reconciliation/settlement-service/) â€” Raw K8s manifests
