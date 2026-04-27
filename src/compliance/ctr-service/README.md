# ctr-service

Service in the compliance domain of LedgerX.

Language: Go Â· Port: 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ctr-service/](../../../helm/charts/ctr-service/) â€” Helm chart
- [manifests/compliance/ctr-service/](../../../manifests/compliance/ctr-service/) â€” Raw K8s manifests
