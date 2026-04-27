# tpp-registry

Service in the open-banking domain of LedgerX.

Language: Go Â· Port: 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tpp-registry/](../../../helm/charts/tpp-registry/) â€” Helm chart
- [manifests/open-banking/tpp-registry/](../../../manifests/open-banking/tpp-registry/) â€” Raw K8s manifests
