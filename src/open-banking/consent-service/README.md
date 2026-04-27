# consent-service

Service in the open-banking domain of LedgerX.

Language: Go Â· Port: 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/consent-service/](../../../helm/charts/consent-service/) â€” Helm chart
- [manifests/open-banking/consent-service/](../../../manifests/open-banking/consent-service/) â€” Raw K8s manifests
