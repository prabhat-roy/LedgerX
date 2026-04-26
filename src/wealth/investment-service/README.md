# investment-service

Service in the **wealth** domain of LedgerX.

**Language:** Go · **Port:** 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/investment-service/](../../../helm/charts/investment-service/) — Helm chart
- [manifests/wealth/investment-service/](../../../manifests/wealth/investment-service/) — Raw K8s manifests
