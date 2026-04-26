# origination-service

Service in the **lending** domain of LedgerX.

**Language:** Go · **Port:** 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/origination-service/](../../../helm/charts/origination-service/) — Helm chart
- [manifests/lending/origination-service/](../../../manifests/lending/origination-service/) — Raw K8s manifests
