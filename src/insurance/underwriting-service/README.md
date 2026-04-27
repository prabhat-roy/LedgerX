# underwriting-service

Service in the insurance domain of LedgerX.

Language: Go Â· Port: 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/underwriting-service/](../../../helm/charts/underwriting-service/) â€” Helm chart
- [manifests/insurance/underwriting-service/](../../../manifests/insurance/underwriting-service/) â€” Raw K8s manifests
