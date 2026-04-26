# sar-service

Service in the **compliance** domain of LedgerX.

**Language:** Go · **Port:** 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sar-service/](../../../helm/charts/sar-service/) — Helm chart
- [manifests/compliance/sar-service/](../../../manifests/compliance/sar-service/) — Raw K8s manifests
