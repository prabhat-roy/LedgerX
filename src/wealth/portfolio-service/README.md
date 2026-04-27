# portfolio-service

Service in the wealth domain of LedgerX.

Language: Go Â· Port: 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/portfolio-service/](../../../helm/charts/portfolio-service/) â€” Helm chart
- [manifests/wealth/portfolio-service/](../../../manifests/wealth/portfolio-service/) â€” Raw K8s manifests
