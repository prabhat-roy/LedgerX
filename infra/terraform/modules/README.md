# Terraform modules — LedgerX

Reusable building blocks shared across cloud directories.

| Module | Purpose |
|---|---|
| aws-vpc | Single-region AWS VPC with private/public subnets across 3 AZs |
| aws-eks | EKS cluster + managed node groups + addons (cluster-autoscaler, aws-load-balancer-controller, ebs-csi) |
| gcp-network | GCP shared VPC with secondary ranges for pods + services |
| gcp-gke | GKE Autopilot cluster with workload identity |
| azure-vnet | Azure VNet + subnets across 3 zones |
| azure-aks | AKS cluster + workload identity + cilium dataplane |
| crdb-cluster | CockroachDB CrdbCluster CR for cockroach-operator |
