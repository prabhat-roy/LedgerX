# statement-service

Service in the notifications domain of LedgerX.

Language: Go Â· Port: 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/statement-service/](../../../helm/charts/statement-service/) â€” Helm chart
- [manifests/notifications/statement-service/](../../../manifests/notifications/statement-service/) â€” Raw K8s manifests
