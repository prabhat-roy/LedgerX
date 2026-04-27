# router-service

Service in the payments domain of LedgerX.

Language: Go Â· Port: 50061

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/router-service/](../../../helm/charts/router-service/) â€” Helm chart
- [manifests/payments/router-service/](../../../manifests/payments/router-service/) â€” Raw K8s manifests
