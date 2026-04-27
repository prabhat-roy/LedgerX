# virtual-card

Service in the cards domain of LedgerX.

Language: Go Â· Port: 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/virtual-card/](../../../helm/charts/virtual-card/) â€” Helm chart
- [manifests/cards/virtual-card/](../../../manifests/cards/virtual-card/) â€” Raw K8s manifests
