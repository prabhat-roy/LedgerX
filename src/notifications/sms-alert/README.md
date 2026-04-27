# sms-alert

Service in the notifications domain of LedgerX.

Language: Go Â· Port: 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sms-alert/](../../../helm/charts/sms-alert/) â€” Helm chart
- [manifests/notifications/sms-alert/](../../../manifests/notifications/sms-alert/) â€” Raw K8s manifests
