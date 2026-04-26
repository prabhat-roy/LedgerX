# orchestrator

Service in the **notifications** domain of LedgerX.

**Language:** Go · **Port:** 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/orchestrator/](../../../helm/charts/orchestrator/) — Helm chart
- [manifests/notifications/orchestrator/](../../../manifests/notifications/orchestrator/) — Raw K8s manifests
