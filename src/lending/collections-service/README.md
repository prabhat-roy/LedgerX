# collections-service

Service in the lending domain of LedgerX.

Language: Go Â· Port: 50104

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/collections-service/](../../../helm/charts/collections-service/) â€” Helm chart
- [manifests/lending/collections-service/](../../../manifests/lending/collections-service/) â€” Raw K8s manifests
