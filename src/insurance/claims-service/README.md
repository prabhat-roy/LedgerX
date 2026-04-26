# claims-service

Service in the **insurance** domain of LedgerX.

**Language:** Go · **Port:** 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/claims-service/](../../../helm/charts/claims-service/) — Helm chart
- [manifests/insurance/claims-service/](../../../manifests/insurance/claims-service/) — Raw K8s manifests
