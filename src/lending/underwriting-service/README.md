# underwriting-service

Service in the lending domain of LedgerX.

Language: Go Â· Port: 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/underwriting-service/](../../../helm/charts/underwriting-service/) â€” Helm chart
- [manifests/lending/underwriting-service/](../../../manifests/lending/underwriting-service/) â€” Raw K8s manifests
