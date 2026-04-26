# fx-service

Service in the **treasury** domain of LedgerX.

**Language:** Go · **Port:** 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fx-service/](../../../helm/charts/fx-service/) — Helm chart
- [manifests/treasury/fx-service/](../../../manifests/treasury/fx-service/) — Raw K8s manifests
