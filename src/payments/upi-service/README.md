# upi-service

Service in the **payments** domain of LedgerX.

**Language:** Go · **Port:** 50064

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/upi-service/](../../../helm/charts/upi-service/) — Helm chart
- [manifests/payments/upi-service/](../../../manifests/payments/upi-service/) — Raw K8s manifests
