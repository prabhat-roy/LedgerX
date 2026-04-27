# lifecycle-service

Service in the cards domain of LedgerX.

Language: Go Â· Port: 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/lifecycle-service/](../../../helm/charts/lifecycle-service/) â€” Helm chart
- [manifests/cards/lifecycle-service/](../../../manifests/cards/lifecycle-service/) â€” Raw K8s manifests
