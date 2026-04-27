# liquidity-service

Service in the treasury domain of LedgerX.

Language: Go Â· Port: 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/liquidity-service/](../../../helm/charts/liquidity-service/) â€” Helm chart
- [manifests/treasury/liquidity-service/](../../../manifests/treasury/liquidity-service/) â€” Raw K8s manifests
