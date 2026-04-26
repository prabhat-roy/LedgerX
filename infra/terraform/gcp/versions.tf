terraform {
  required_version = ">= 1.6"
  required_providers {
    google      = { source = "hashicorp/google", version = "~> 5.20" }
    google-beta = { source = "hashicorp/google-beta", version = "~> 5.20" }
    helm        = { source = "hashicorp/helm", version = "~> 2.13" }
    kubernetes  = { source = "hashicorp/kubernetes", version = "~> 2.27" }
  }
  backend "gcs" {
    bucket = "ledgerx-tf-state"
    prefix = "gcp/prod"
  }
}

provider "google" { alias = "use1", region = "us-east1", project = var.project }
provider "google" { alias = "euw1", region = "europe-west1", project = var.project }
provider "google" { alias = "asis1", region = "asia-south1", project = var.project }
