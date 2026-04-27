# psd2-service

Service in the open-banking domain of LedgerX.

Language: Go Â· Port: 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/psd2-service/](../../../helm/charts/psd2-service/) â€” Helm chart
- [manifests/open-banking/psd2-service/](../../../manifests/open-banking/psd2-service/) â€” Raw K8s manifests
