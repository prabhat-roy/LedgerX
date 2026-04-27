# reconciliation-service

Service in the reconciliation domain of LedgerX.

Language: Go Â· Port: 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reconciliation-service/](../../../helm/charts/reconciliation-service/) â€” Helm chart
- [manifests/reconciliation/reconciliation-service/](../../../manifests/reconciliation/reconciliation-service/) â€” Raw K8s manifests
