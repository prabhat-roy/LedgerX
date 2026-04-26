# profile-service

Service in the **customer-360** domain of LedgerX.

**Language:** Go · **Port:** 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/profile-service/](../../../helm/charts/profile-service/) — Helm chart
- [manifests/customer-360/profile-service/](../../../manifests/customer-360/profile-service/) — Raw K8s manifests
