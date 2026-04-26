# GCP Secret Manager with automatic multi-region replication.
resource "google_secret_manager_secret" "ledger_service_db" {
  secret_id = "ledger-service-db"
  replication {
    user_managed {
      replicas { location = "us-east1" }
      replicas { location = "europe-west1" }
      replicas { location = "asia-south1" }
    }
  }
}

resource "google_secret_manager_secret" "payment_router_kafka" {
  secret_id = "payment-router-kafka"
  replication {
    user_managed {
      replicas { location = "us-east1" }
      replicas { location = "europe-west1" }
      replicas { location = "asia-south1" }
    }
  }
}
