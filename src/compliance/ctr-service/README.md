# ctr-service

Service in the **compliance** domain of LedgerX.

**Language:** Go · **Port:** 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ctr-service/](../../../helm/charts/ctr-service/) — Helm chart
- [manifests/compliance/ctr-service/](../../../manifests/compliance/ctr-service/) — Raw K8s manifests
