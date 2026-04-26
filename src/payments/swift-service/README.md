# swift-service

Service in the **payments** domain of LedgerX.

**Language:** Go · **Port:** 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/swift-service/](../../../helm/charts/swift-service/) — Helm chart
- [manifests/payments/swift-service/](../../../manifests/payments/swift-service/) — Raw K8s manifests
