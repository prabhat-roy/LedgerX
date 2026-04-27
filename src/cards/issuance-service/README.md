# issuance-service

Service in the cards domain of LedgerX.

Language: Go Â· Port: 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/issuance-service/](../../../helm/charts/issuance-service/) â€” Helm chart
- [manifests/cards/issuance-service/](../../../manifests/cards/issuance-service/) â€” Raw K8s manifests
