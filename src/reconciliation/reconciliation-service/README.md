# reconciliation-service

Service in the **reconciliation** domain of LedgerX.

**Language:** Go · **Port:** 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reconciliation-service/](../../../helm/charts/reconciliation-service/) — Helm chart
- [manifests/reconciliation/reconciliation-service/](../../../manifests/reconciliation/reconciliation-service/) — Raw K8s manifests
