# AWS Secrets Manager + KMS Customer Managed Keys for service secrets.
resource "aws_kms_key" "secrets" {
  provider                = aws.use1
  description             = "ledgerx Secrets Manager KMS key (multi-region)"
  enable_key_rotation     = true
  deletion_window_in_days = 30
  multi_region            = true
}

resource "aws_secretsmanager_secret" "ledger_service_db" {
  provider    = aws.use1
  name        = "ledgerx/${var.env}/ledger-service/db"
  kms_key_id  = aws_kms_key.secrets.arn
  description = "ledger-service CockroachDB credentials"

  replica { region = "eu-west-1" }
  replica { region = "ap-south-1" }
}

resource "aws_secretsmanager_secret" "payment_router_kafka" {
  provider   = aws.use1
  name       = "ledgerx/${var.env}/payment-router/kafka"
  kms_key_id = aws_kms_key.secrets.arn
}
