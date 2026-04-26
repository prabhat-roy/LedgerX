# regulatory-reporting

Service in the **compliance** domain of LedgerX.

**Language:** Go · **Port:** 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/regulatory-reporting/](../../../helm/charts/regulatory-reporting/) — Helm chart
- [manifests/compliance/regulatory-reporting/](../../../manifests/compliance/regulatory-reporting/) — Raw K8s manifests
