# hedging-service

Service in the **treasury** domain of LedgerX.

**Language:** Go · **Port:** 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/hedging-service/](../../../helm/charts/hedging-service/) — Helm chart
- [manifests/treasury/hedging-service/](../../../manifests/treasury/hedging-service/) — Raw K8s manifests
