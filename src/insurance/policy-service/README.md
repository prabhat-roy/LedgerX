# policy-service

Service in the insurance domain of LedgerX.

Language: Go Â· Port: 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) â€” Helm chart
- [manifests/insurance/policy-service/](../../../manifests/insurance/policy-service/) â€” Raw K8s manifests
