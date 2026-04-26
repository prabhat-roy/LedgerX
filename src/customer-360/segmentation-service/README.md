# segmentation-service

Service in the **customer-360** domain of LedgerX.

**Language:** Go · **Port:** 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/segmentation-service/](../../../helm/charts/segmentation-service/) — Helm chart
- [manifests/customer-360/segmentation-service/](../../../manifests/customer-360/segmentation-service/) — Raw K8s manifests
