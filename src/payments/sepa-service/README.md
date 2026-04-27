# sepa-service

Service in the payments domain of LedgerX.

Language: Go Â· Port: 50063

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sepa-service/](../../../helm/charts/sepa-service/) â€” Helm chart
- [manifests/payments/sepa-service/](../../../manifests/payments/sepa-service/) â€” Raw K8s manifests
