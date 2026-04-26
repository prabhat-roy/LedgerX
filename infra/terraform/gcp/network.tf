# Single global VPC + per-region subnets — GCP gives us global routing for free.
resource "google_compute_network" "ledgerx" {
  provider                = google.use1
  name                    = "ledgerx-${var.env}"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "use1" {
  provider      = google.use1
  name          = "ledgerx-use1-${var.env}"
  ip_cidr_range = var.vpc_cidrs["us-east1"]
  network       = google_compute_network.ledgerx.id
  region        = "us-east1"
  private_ip_google_access = true
  secondary_ip_range = [
    { range_name = "pods", ip_cidr_range = "10.210.0.0/14" },
    { range_name = "services", ip_cidr_range = "10.214.0.0/20" }
  ]
}

resource "google_compute_subnetwork" "euw1" {
  provider      = google.euw1
  name          = "ledgerx-euw1-${var.env}"
  ip_cidr_range = var.vpc_cidrs["europe-west1"]
  network       = google_compute_network.ledgerx.id
  region        = "europe-west1"
  private_ip_google_access = true
  secondary_ip_range = [
    { range_name = "pods", ip_cidr_range = "10.220.0.0/14" },
    { range_name = "services", ip_cidr_range = "10.224.0.0/20" }
  ]
}

resource "google_compute_subnetwork" "asis1" {
  provider      = google.asis1
  name          = "ledgerx-asis1-${var.env}"
  ip_cidr_range = var.vpc_cidrs["asia-south1"]
  network       = google_compute_network.ledgerx.id
  region        = "asia-south1"
  private_ip_google_access = true
  secondary_ip_range = [
    { range_name = "pods", ip_cidr_range = "10.230.0.0/14" },
    { range_name = "services", ip_cidr_range = "10.234.0.0/20" }
  ]
}
