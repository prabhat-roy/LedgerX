# liquidity-service

Service in the **treasury** domain of LedgerX.

**Language:** Go · **Port:** 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/liquidity-service/](../../../helm/charts/liquidity-service/) — Helm chart
- [manifests/treasury/liquidity-service/](../../../manifests/treasury/liquidity-service/) — Raw K8s manifests
