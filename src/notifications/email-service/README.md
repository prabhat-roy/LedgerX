# email-service

Service in the **notifications** domain of LedgerX.

**Language:** Go · **Port:** 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/email-service/](../../../helm/charts/email-service/) — Helm chart
- [manifests/notifications/email-service/](../../../manifests/notifications/email-service/) — Raw K8s manifests
