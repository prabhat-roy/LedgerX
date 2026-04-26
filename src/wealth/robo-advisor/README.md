# robo-advisor

Service in the **wealth** domain of LedgerX.

**Language:** Go · **Port:** 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/robo-advisor/](../../../helm/charts/robo-advisor/) — Helm chart
- [manifests/wealth/robo-advisor/](../../../manifests/wealth/robo-advisor/) — Raw K8s manifests
