# collections-service

Service in the **lending** domain of LedgerX.

**Language:** Go · **Port:** 50104

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/collections-service/](../../../helm/charts/collections-service/) — Helm chart
- [manifests/lending/collections-service/](../../../manifests/lending/collections-service/) — Raw K8s manifests
