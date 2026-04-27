# fx-service

Service in the treasury domain of LedgerX.

Language: Go Â· Port: 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fx-service/](../../../helm/charts/fx-service/) â€” Helm chart
- [manifests/treasury/fx-service/](../../../manifests/treasury/fx-service/) â€” Raw K8s manifests
