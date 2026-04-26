# issuance-service

Service in the **cards** domain of LedgerX.

**Language:** Go · **Port:** 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/issuance-service/](../../../helm/charts/issuance-service/) — Helm chart
- [manifests/cards/issuance-service/](../../../manifests/cards/issuance-service/) — Raw K8s manifests
