# identity-verification

Service in the **kyc** domain of LedgerX.

**Language:** Go · **Port:** 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/identity-verification/](../../../helm/charts/identity-verification/) — Helm chart
- [manifests/kyc/identity-verification/](../../../manifests/kyc/identity-verification/) — Raw K8s manifests
