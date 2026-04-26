# portfolio-service

Service in the **wealth** domain of LedgerX.

**Language:** Go · **Port:** 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/portfolio-service/](../../../helm/charts/portfolio-service/) — Helm chart
- [manifests/wealth/portfolio-service/](../../../manifests/wealth/portfolio-service/) — Raw K8s manifests
