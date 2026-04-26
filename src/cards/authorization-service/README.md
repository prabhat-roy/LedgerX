# authorization-service

Service in the **cards** domain of LedgerX.

**Language:** Go · **Port:** 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/authorization-service/](../../../helm/charts/authorization-service/) — Helm chart
- [manifests/cards/authorization-service/](../../../manifests/cards/authorization-service/) — Raw K8s manifests
