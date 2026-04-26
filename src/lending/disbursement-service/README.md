# disbursement-service

Service in the **lending** domain of LedgerX.

**Language:** Go · **Port:** 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/disbursement-service/](../../../helm/charts/disbursement-service/) — Helm chart
- [manifests/lending/disbursement-service/](../../../manifests/lending/disbursement-service/) — Raw K8s manifests
