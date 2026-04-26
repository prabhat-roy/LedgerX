# Encrypted S3 buckets for service artifacts, statements, regulatory reports.
resource "aws_s3_bucket" "statements" {
  provider = aws.use1
  bucket   = "ledgerx-statements-${var.env}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "statements" {
  provider = aws.use1
  bucket   = aws_s3_bucket.statements.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.crdb_backups.arn
    }
  }
}

resource "aws_s3_bucket_versioning" "statements" {
  provider = aws.use1
  bucket   = aws_s3_bucket.statements.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_replication_configuration" "statements_to_euw1" {
  provider = aws.use1
  bucket   = aws_s3_bucket.statements.id
  role     = aws_iam_role.s3_replication.arn

  rule {
    id     = "replicate-to-euw1"
    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.statements_replica_euw1.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket" "statements_replica_euw1" {
  provider = aws.euw1
  bucket   = "ledgerx-statements-replica-euw1-${var.env}"
}

resource "aws_iam_role" "s3_replication" {
  provider = aws.use1
  name     = "ledgerx-s3-replication-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{ Effect = "Allow", Principal = { Service = "s3.amazonaws.com" }, Action = "sts:AssumeRole" }]
  })
}

# Card data tokenisation vault bucket — separated and tightly restricted.
resource "aws_s3_bucket" "tokenisation_vault" {
  provider = aws.use1
  bucket   = "ledgerx-tokenisation-vault-${var.env}"
}

resource "aws_s3_bucket_public_access_block" "tokenisation_vault" {
  provider                = aws.use1
  bucket                  = aws_s3_bucket.tokenisation_vault.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
