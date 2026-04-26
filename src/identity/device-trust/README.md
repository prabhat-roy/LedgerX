# device-trust

Service in the **identity** domain of LedgerX.

**Language:** Go · **Port:** 50023

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/device-trust/](../../../helm/charts/device-trust/) — Helm chart
- [manifests/identity/device-trust/](../../../manifests/identity/device-trust/) — Raw K8s manifests
