# router-service

Service in the **payments** domain of LedgerX.

**Language:** Go · **Port:** 50061

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/router-service/](../../../helm/charts/router-service/) — Helm chart
- [manifests/payments/router-service/](../../../manifests/payments/router-service/) — Raw K8s manifests
