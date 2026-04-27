# authorization-service

Service in the cards domain of LedgerX.

Language: Go Â· Port: 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/authorization-service/](../../../helm/charts/authorization-service/) â€” Helm chart
- [manifests/cards/authorization-service/](../../../manifests/cards/authorization-service/) â€” Raw K8s manifests
