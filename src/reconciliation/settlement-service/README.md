# settlement-service

Service in the **reconciliation** domain of LedgerX.

**Language:** Go · **Port:** 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/settlement-service/](../../../helm/charts/settlement-service/) — Helm chart
- [manifests/reconciliation/settlement-service/](../../../manifests/reconciliation/settlement-service/) — Raw K8s manifests
