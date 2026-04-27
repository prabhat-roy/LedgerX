# device-trust

Service in the identity domain of LedgerX.

Language: Go Â· Port: 50023

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/device-trust/](../../../helm/charts/device-trust/) â€” Helm chart
- [manifests/identity/device-trust/](../../../manifests/identity/device-trust/) â€” Raw K8s manifests
