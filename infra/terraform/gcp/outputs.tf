output "gke_endpoints" {
  value = {
    use1  = google_container_cluster.use1.endpoint
    euw1  = google_container_cluster.euw1.endpoint
    asis1 = google_container_cluster.asis1.endpoint
  }
}

output "vpc_id" { value = google_compute_network.ledgerx.id }
output "card_kek_id" { value = google_kms_crypto_key.card_kek.id }
