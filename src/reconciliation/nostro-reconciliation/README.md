# nostro-reconciliation

Service in the **reconciliation** domain of LedgerX.

**Language:** Go · **Port:** 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nostro-reconciliation/](../../../helm/charts/nostro-reconciliation/) — Helm chart
- [manifests/reconciliation/nostro-reconciliation/](../../../manifests/reconciliation/nostro-reconciliation/) — Raw K8s manifests
