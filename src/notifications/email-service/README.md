# email-service

Service in the notifications domain of LedgerX.

Language: Go Â· Port: 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/email-service/](../../../helm/charts/email-service/) â€” Helm chart
- [manifests/notifications/email-service/](../../../manifests/notifications/email-service/) â€” Raw K8s manifests
