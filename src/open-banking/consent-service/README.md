# consent-service

Service in the **open-banking** domain of LedgerX.

**Language:** Go · **Port:** 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/consent-service/](../../../helm/charts/consent-service/) — Helm chart
- [manifests/open-banking/consent-service/](../../../manifests/open-banking/consent-service/) — Raw K8s manifests
