# Three GKE Autopilot clusters — one per region, active-active.
resource "google_container_cluster" "use1" {
  provider                 = google.use1
  name                     = "ledgerx-use1"
  location                 = "us-east1"
  enable_autopilot         = true
  network                  = google_compute_network.ledgerx.id
  subnetwork               = google_compute_subnetwork.use1.id
  release_channel { channel = "REGULAR" }
  workload_identity_config { workload_pool = "${var.project}.svc.id.goog" }
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
  binary_authorization { evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE" }
  database_encryption {
    state    = "ENCRYPTED"
    key_name = google_kms_crypto_key.gke_use1.id
  }
}

resource "google_container_cluster" "euw1" {
  provider         = google.euw1
  name             = "ledgerx-euw1"
  location         = "europe-west1"
  enable_autopilot = true
  network          = google_compute_network.ledgerx.id
  subnetwork       = google_compute_subnetwork.euw1.id
  workload_identity_config { workload_pool = "${var.project}.svc.id.goog" }
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}

resource "google_container_cluster" "asis1" {
  provider         = google.asis1
  name             = "ledgerx-asis1"
  location         = "asia-south1"
  enable_autopilot = true
  network          = google_compute_network.ledgerx.id
  subnetwork       = google_compute_subnetwork.asis1.id
  workload_identity_config { workload_pool = "${var.project}.svc.id.goog" }
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}
