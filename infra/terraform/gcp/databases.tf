# CockroachDB self-managed via cockroach-operator on GKE — one CrdbCluster CR spans 3 regions.
# Spanner is not used because CRDB gives us PostgreSQL wire compatibility.

resource "google_kms_key_ring" "ledgerx_use1" {
  provider = google.use1
  name     = "ledgerx-${var.env}"
  location = "us-east1"
}

resource "google_kms_crypto_key" "gke_use1" {
  name     = "ledgerx-gke-use1"
  key_ring = google_kms_key_ring.ledgerx_use1.id
  rotation_period = "7776000s" # 90 days
}

# Cloud SQL (PostgreSQL) for non-ledger transactional services, with cross-region read replicas.
resource "google_sql_database_instance" "primary_use1" {
  provider          = google.use1
  name              = "ledgerx-pg-use1-${var.env}"
  database_version  = "POSTGRES_15"
  region            = "us-east1"
  deletion_protection = true
  settings {
    tier              = "db-custom-4-16384"
    availability_type = "REGIONAL"  # Always-on HA
    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      backup_retention_settings { retained_backups = 35 }
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.ledgerx.id
    }
    database_flags { name = "max_connections", value = "1000" }
  }
}

resource "google_sql_database_instance" "replica_euw1" {
  provider             = google.euw1
  name                 = "ledgerx-pg-replica-euw1-${var.env}"
  master_instance_name = google_sql_database_instance.primary_use1.name
  database_version     = "POSTGRES_15"
  region               = "europe-west1"
  replica_configuration { failover_target = false }
  settings { tier = "db-custom-4-16384", availability_type = "REGIONAL" }
}

# HSM-backed KMS for KEKs (PCI-DSS).
resource "google_kms_crypto_key" "card_kek" {
  name             = "ledgerx-card-kek"
  key_ring         = google_kms_key_ring.ledgerx_use1.id
  rotation_period  = "2592000s" # 30 days
  version_template { algorithm = "GOOGLE_SYMMETRIC_ENCRYPTION", protection_level = "HSM" }
}
