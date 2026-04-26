# Multi-region GCS buckets for statements + regulatory artefacts.
resource "google_storage_bucket" "statements" {
  provider                    = google.use1
  name                        = "ledgerx-statements-${var.env}"
  location                    = "US"  # multi-region
  uniform_bucket_level_access = true
  versioning { enabled = true }
  lifecycle_rule {
    action { type = "SetStorageClass", storage_class = "NEARLINE" }
    condition { age = 90 }
  }
  encryption { default_kms_key_name = google_kms_crypto_key.gke_use1.id }
}

resource "google_storage_bucket" "tokenisation_vault" {
  provider                    = google.use1
  name                        = "ledgerx-tokenisation-vault-${var.env}"
  location                    = "us-east1"
  uniform_bucket_level_access = true
  versioning { enabled = true }
  encryption { default_kms_key_name = google_kms_crypto_key.card_kek.id }
}
