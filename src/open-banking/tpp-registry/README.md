# tpp-registry

Service in the **open-banking** domain of LedgerX.

**Language:** Go · **Port:** 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tpp-registry/](../../../helm/charts/tpp-registry/) — Helm chart
- [manifests/open-banking/tpp-registry/](../../../manifests/open-banking/tpp-registry/) — Raw K8s manifests
