# Helm — LedgerX

Per-service Helm charts and shared infrastructure charts.

## Layout
```
helm/
  charts/
    <service-name>/
      Chart.yaml
      values.yaml          (cloud-agnostic defaults)
      values-aws.yaml      (EKS overlay — IRSA, ALB, Secrets Manager)
      values-gcp.yaml      (GKE overlay — Workload Identity, GCLB, Secret Manager)
      values-azure.yaml    (AKS overlay — Workload Identity, AppGW, Key Vault)
      templates/
        _helpers.tpl
        deployment.yaml
        service.yaml
        serviceaccount.yaml
```

## Conventions
- `helm install <release> charts/<service> -f charts/<service>/values-<cloud>.yaml`
- All charts run as non-root, read-only root FS, `seccompProfile=RuntimeDefault`
- `/healthz` liveness + readiness probes
- Money-moving services (ledger, payment-router, settlement) get blue-green via Argo Rollouts
- All other services get progressive canary
