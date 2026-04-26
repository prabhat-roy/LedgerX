# sepa-service

Service in the **payments** domain of LedgerX.

**Language:** Go · **Port:** 50063

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sepa-service/](../../../helm/charts/sepa-service/) — Helm chart
- [manifests/payments/sepa-service/](../../../manifests/payments/sepa-service/) — Raw K8s manifests
