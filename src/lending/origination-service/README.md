# origination-service

Service in the lending domain of LedgerX.

Language: Go Â· Port: 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/origination-service/](../../../helm/charts/origination-service/) â€” Helm chart
- [manifests/lending/origination-service/](../../../manifests/lending/origination-service/) â€” Raw K8s manifests
