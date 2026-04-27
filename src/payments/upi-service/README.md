# upi-service

Service in the payments domain of LedgerX.

Language: Go Â· Port: 50064

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/upi-service/](../../../helm/charts/upi-service/) â€” Helm chart
- [manifests/payments/upi-service/](../../../manifests/payments/upi-service/) â€” Raw K8s manifests
