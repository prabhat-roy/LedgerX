# disbursement-service

Service in the lending domain of LedgerX.

Language: Go Â· Port: 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/disbursement-service/](../../../helm/charts/disbursement-service/) â€” Helm chart
- [manifests/lending/disbursement-service/](../../../manifests/lending/disbursement-service/) â€” Raw K8s manifests
