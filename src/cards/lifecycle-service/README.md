# lifecycle-service

Service in the **cards** domain of LedgerX.

**Language:** Go · **Port:** 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/lifecycle-service/](../../../helm/charts/lifecycle-service/) — Helm chart
- [manifests/cards/lifecycle-service/](../../../manifests/cards/lifecycle-service/) — Raw K8s manifests
