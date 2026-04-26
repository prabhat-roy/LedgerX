# underwriting-service

Service in the **insurance** domain of LedgerX.

**Language:** Go · **Port:** 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/underwriting-service/](../../../helm/charts/underwriting-service/) — Helm chart
- [manifests/insurance/underwriting-service/](../../../manifests/insurance/underwriting-service/) — Raw K8s manifests
