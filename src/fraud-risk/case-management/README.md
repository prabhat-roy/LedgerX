# case-management

Service in the **fraud-risk** domain of LedgerX.

**Language:** Go · **Port:** 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/case-management/](../../../helm/charts/case-management/) — Helm chart
- [manifests/fraud-risk/case-management/](../../../manifests/fraud-risk/case-management/) — Raw K8s manifests
