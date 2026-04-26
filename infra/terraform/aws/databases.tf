# CockroachDB multi-region cluster (3 nodes per region) — strong consistency for the ledger.
# Deployed via the cockroach-operator on each EKS cluster, configured with locality.
# This file lays down the supporting AWS resources: KMS key for backups, S3 backup bucket,
# and Route53 PrivateHostedZone for cross-region member discovery.

resource "aws_kms_key" "crdb_backups" {
  provider                = aws.use1
  description             = "ledgerx CRDB backups encryption (multi-region replicated)"
  enable_key_rotation     = true
  deletion_window_in_days = 30
  multi_region            = true
  tags = { Name = "ledgerx-crdb-backups", env = var.env }
}

resource "aws_s3_bucket" "crdb_backups_use1" {
  provider = aws.use1
  bucket   = "ledgerx-crdb-backups-use1-${var.env}"
}

resource "aws_s3_bucket" "crdb_backups_euw1" {
  provider = aws.euw1
  bucket   = "ledgerx-crdb-backups-euw1-${var.env}"
}

resource "aws_s3_bucket" "crdb_backups_aps1" {
  provider = aws.aps1
  bucket   = "ledgerx-crdb-backups-aps1-${var.env}"
}

# RDS for non-ledger transactional data (per-region read replicas).
resource "aws_db_subnet_group" "use1" {
  provider   = aws.use1
  name       = "ledgerx-rds-use1"
  subnet_ids = module.vpc_use1.private_subnet_ids
}

resource "aws_rds_cluster" "use1_aurora_pg" {
  provider               = aws.use1
  cluster_identifier     = "ledgerx-aurora-pg-use1-${var.env}"
  engine                 = "aurora-postgresql"
  engine_mode            = "provisioned"
  engine_version         = "15.5"
  database_name          = "ledgerx"
  master_username        = "ledgerx_admin"
  manage_master_user_password = true
  storage_encrypted      = true
  kms_key_id             = aws_kms_key.crdb_backups.arn
  db_subnet_group_name   = aws_db_subnet_group.use1.name
  backup_retention_period = 35
  preferred_backup_window = "03:00-04:00"
  deletion_protection    = true
}

# CloudHSM cluster for KEK storage (PCI-DSS requirement).
resource "aws_cloudhsm_v2_cluster" "use1" {
  provider   = aws.use1
  hsm_type   = "hsm1.medium"
  subnet_ids = module.vpc_use1.private_subnet_ids
  tags       = { Name = "ledgerx-cloudhsm-use1", env = var.env, pci_dss = "true" }
}
