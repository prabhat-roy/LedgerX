# market-data

Service in the **wealth** domain of LedgerX.

**Language:** Go · **Port:** 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/market-data/](../../../helm/charts/market-data/) — Helm chart
- [manifests/wealth/market-data/](../../../manifests/wealth/market-data/) — Raw K8s manifests
