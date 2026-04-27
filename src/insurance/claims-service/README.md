# claims-service

Service in the insurance domain of LedgerX.

Language: Go Â· Port: 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/claims-service/](../../../helm/charts/claims-service/) â€” Helm chart
- [manifests/insurance/claims-service/](../../../manifests/insurance/claims-service/) â€” Raw K8s manifests
