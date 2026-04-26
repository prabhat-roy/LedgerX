# statement-service

Service in the **notifications** domain of LedgerX.

**Language:** Go · **Port:** 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/statement-service/](../../../helm/charts/statement-service/) — Helm chart
- [manifests/notifications/statement-service/](../../../manifests/notifications/statement-service/) — Raw K8s manifests
