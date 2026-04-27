# sar-service

Service in the compliance domain of LedgerX.

Language: Go Â· Port: 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sar-service/](../../../helm/charts/sar-service/) â€” Helm chart
- [manifests/compliance/sar-service/](../../../manifests/compliance/sar-service/) â€” Raw K8s manifests
