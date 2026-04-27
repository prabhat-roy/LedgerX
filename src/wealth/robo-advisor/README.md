# robo-advisor

Service in the wealth domain of LedgerX.

Language: Go Â· Port: 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/robo-advisor/](../../../helm/charts/robo-advisor/) â€” Helm chart
- [manifests/wealth/robo-advisor/](../../../manifests/wealth/robo-advisor/) â€” Raw K8s manifests
