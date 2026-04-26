# session-service

Service in the **identity** domain of LedgerX.

**Language:** Go · **Port:** 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/session-service/](../../../helm/charts/session-service/) — Helm chart
- [manifests/identity/session-service/](../../../manifests/identity/session-service/) — Raw K8s manifests
