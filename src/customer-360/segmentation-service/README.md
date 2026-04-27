# segmentation-service

Service in the customer-360 domain of LedgerX.

Language: Go Â· Port: 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/segmentation-service/](../../../helm/charts/segmentation-service/) â€” Helm chart
- [manifests/customer-360/segmentation-service/](../../../manifests/customer-360/segmentation-service/) â€” Raw K8s manifests
