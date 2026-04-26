# helm/charts — LedgerX

One Helm chart per microservice. Each chart contains:

| File | Purpose |
|---|---|
| Chart.yaml | Chart metadata |
| values.yaml | Cloud-agnostic defaults |
| values-aws.yaml | EKS overlay (IRSA, ALB, Secrets Manager CSI) |
| values-gcp.yaml | GKE overlay (Workload Identity, GCLB, Secret Manager CSI) |
| values-azure.yaml | AKS overlay (Workload Identity, AppGW, Key Vault CSI) |
| templates/_helpers.tpl | Shared template helpers |
| templates/deployment.yaml | Deployment manifest |
| templates/service.yaml | ClusterIP service |
| templates/serviceaccount.yaml | Service account (cloud-IAM bound) |
