# Infra — LedgerX

Multi-cloud, multi-region active-active IaC: Terraform / OpenTofu / Crossplane.

```
infra/
  terraform/
    aws/      EKS clusters in us-east-1, eu-west-1, ap-south-1
    gcp/      GKE clusters in us-east1, europe-west1, asia-south1
    azure/    AKS clusters in eastus, westeurope, centralindia
    modules/  Reusable VPC / network / database modules
```

## Multi-region active-active
- CockroachDB: 9-node multi-region cluster (3 nodes per region) — strong consistency on the ledger
- EventStoreDB: per-region cluster, replicated via Kafka mirror
- Kafka: stretched cluster with Conduktor Gateway for schema + PII masking
- HSM: regional CloudHSM / Cloud HSM / Managed HSM clusters with cross-region replication
