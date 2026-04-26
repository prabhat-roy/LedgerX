# underwriting-service

Service in the **lending** domain of LedgerX.

**Language:** Go · **Port:** 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/underwriting-service/](../../../helm/charts/underwriting-service/) — Helm chart
- [manifests/lending/underwriting-service/](../../../manifests/lending/underwriting-service/) — Raw K8s manifests
