# api-gateway-ob

Service in the **open-banking** domain of LedgerX.

**Language:** Go · **Port:** 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/api-gateway-ob/](../../../helm/charts/api-gateway-ob/) — Helm chart
- [manifests/open-banking/api-gateway-ob/](../../../manifests/open-banking/api-gateway-ob/) — Raw K8s manifests
