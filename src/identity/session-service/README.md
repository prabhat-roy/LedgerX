# session-service

Service in the identity domain of LedgerX.

Language: Go Â· Port: 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/session-service/](../../../helm/charts/session-service/) â€” Helm chart
- [manifests/identity/session-service/](../../../manifests/identity/session-service/) â€” Raw K8s manifests
