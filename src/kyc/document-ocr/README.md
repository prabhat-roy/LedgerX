# document-ocr

Service in the **kyc** domain of LedgerX.

**Language:** Go · **Port:** 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/document-ocr/](../../../helm/charts/document-ocr/) — Helm chart
- [manifests/kyc/document-ocr/](../../../manifests/kyc/document-ocr/) — Raw K8s manifests
