# relationship-service

Service in the customer-360 domain of LedgerX.

Language: Go Â· Port: 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/relationship-service/](../../../helm/charts/relationship-service/) â€” Helm chart
- [manifests/customer-360/relationship-service/](../../../manifests/customer-360/relationship-service/) â€” Raw K8s manifests
