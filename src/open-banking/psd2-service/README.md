# psd2-service

Service in the **open-banking** domain of LedgerX.

**Language:** Go · **Port:** 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/psd2-service/](../../../helm/charts/psd2-service/) — Helm chart
- [manifests/open-banking/psd2-service/](../../../manifests/open-banking/psd2-service/) — Raw K8s manifests
