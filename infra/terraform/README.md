# Terraform — LedgerX

Apply cloud-by-cloud. Each cloud directory is independently runnable.

```
cd terraform/aws  && terraform init && terraform apply -var-file=prod.tfvars
cd terraform/gcp  && terraform init && terraform apply -var-file=prod.tfvars
cd terraform/azure && terraform init && terraform apply -var-file=prod.tfvars
```

State is held in remote backends (S3/GCS/AzureRM) configured per cloud.
