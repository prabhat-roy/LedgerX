# aml-service

Service in the **kyc** domain of LedgerX.

**Language:** Go · **Port:** 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-service/](../../../helm/charts/aml-service/) — Helm chart
- [manifests/kyc/aml-service/](../../../manifests/kyc/aml-service/) — Raw K8s manifests
