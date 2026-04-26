# virtual-card

Service in the **cards** domain of LedgerX.

**Language:** Go · **Port:** 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/virtual-card/](../../../helm/charts/virtual-card/) — Helm chart
- [manifests/cards/virtual-card/](../../../manifests/cards/virtual-card/) — Raw K8s manifests
