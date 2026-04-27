# aml-service

Service in the kyc domain of LedgerX.

Language: Go Â· Port: 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-service/](../../../helm/charts/aml-service/) â€” Helm chart
- [manifests/kyc/aml-service/](../../../manifests/kyc/aml-service/) â€” Raw K8s manifests
