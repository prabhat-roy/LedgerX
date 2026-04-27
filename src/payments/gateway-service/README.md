# gateway-service

Service in the payments domain of LedgerX.

Language: Go Â· Port: 50060

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/gateway-service/](../../../helm/charts/gateway-service/) â€” Helm chart
- [manifests/payments/gateway-service/](../../../manifests/payments/gateway-service/) â€” Raw K8s manifests
