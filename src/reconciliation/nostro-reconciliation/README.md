# nostro-reconciliation

Service in the reconciliation domain of LedgerX.

Language: Go Â· Port: 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nostro-reconciliation/](../../../helm/charts/nostro-reconciliation/) â€” Helm chart
- [manifests/reconciliation/nostro-reconciliation/](../../../manifests/reconciliation/nostro-reconciliation/) â€” Raw K8s manifests
