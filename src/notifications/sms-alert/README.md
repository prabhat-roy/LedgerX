# sms-alert

Service in the **notifications** domain of LedgerX.

**Language:** Go · **Port:** 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sms-alert/](../../../helm/charts/sms-alert/) — Helm chart
- [manifests/notifications/sms-alert/](../../../manifests/notifications/sms-alert/) — Raw K8s manifests
