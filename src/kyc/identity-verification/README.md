# identity-verification

Service in the kyc domain of LedgerX.

Language: Go Â· Port: 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/identity-verification/](../../../helm/charts/identity-verification/) â€” Helm chart
- [manifests/kyc/identity-verification/](../../../manifests/kyc/identity-verification/) â€” Raw K8s manifests
