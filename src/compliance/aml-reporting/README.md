# aml-reporting

Service in the **compliance** domain of LedgerX.

**Language:** Go · **Port:** 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-reporting/](../../../helm/charts/aml-reporting/) — Helm chart
- [manifests/compliance/aml-reporting/](../../../manifests/compliance/aml-reporting/) — Raw K8s manifests
