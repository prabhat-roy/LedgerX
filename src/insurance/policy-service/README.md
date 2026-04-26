# policy-service

Service in the **insurance** domain of LedgerX.

**Language:** Go · **Port:** 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) — Helm chart
- [manifests/insurance/policy-service/](../../../manifests/insurance/policy-service/) — Raw K8s manifests
