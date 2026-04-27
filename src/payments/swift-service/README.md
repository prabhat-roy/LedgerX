# swift-service

Service in the payments domain of LedgerX.

Language: Go Â· Port: 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/swift-service/](../../../helm/charts/swift-service/) â€” Helm chart
- [manifests/payments/swift-service/](../../../manifests/payments/swift-service/) â€” Raw K8s manifests
