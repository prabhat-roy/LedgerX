# orchestrator

Service in the notifications domain of LedgerX.

Language: Go Â· Port: 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/orchestrator/](../../../helm/charts/orchestrator/) â€” Helm chart
- [manifests/notifications/orchestrator/](../../../manifests/notifications/orchestrator/) â€” Raw K8s manifests
