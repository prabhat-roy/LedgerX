# aml-reporting

Service in the compliance domain of LedgerX.

Language: Go Â· Port: 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-reporting/](../../../helm/charts/aml-reporting/) â€” Helm chart
- [manifests/compliance/aml-reporting/](../../../manifests/compliance/aml-reporting/) â€” Raw K8s manifests
