# api-gateway-ob

Service in the open-banking domain of LedgerX.

Language: Go Â· Port: 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/api-gateway-ob/](../../../helm/charts/api-gateway-ob/) â€” Helm chart
- [manifests/open-banking/api-gateway-ob/](../../../manifests/open-banking/api-gateway-ob/) â€” Raw K8s manifests
