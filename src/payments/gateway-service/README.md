# gateway-service

Service in the **payments** domain of LedgerX.

**Language:** Go · **Port:** 50060

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/gateway-service/](../../../helm/charts/gateway-service/) — Helm chart
- [manifests/payments/gateway-service/](../../../manifests/payments/gateway-service/) — Raw K8s manifests
