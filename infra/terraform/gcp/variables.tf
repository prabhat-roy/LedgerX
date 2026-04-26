variable "project" {
  description = "GCP project id"
  type        = string
}

variable "env" { type = string, default = "prod" }

variable "regions" {
  type    = list(string)
  default = ["us-east1", "europe-west1", "asia-south1"]
}

variable "vpc_cidrs" {
  type = map(string)
  default = {
    "us-east1"     = "10.110.0.0/16"
    "europe-west1" = "10.120.0.0/16"
    "asia-south1"  = "10.130.0.0/16"
  }
}

variable "gke_node_min" { default = 3 }
variable "gke_node_max" { default = 30 }
variable "cockroach_nodes_per_region" { default = 3 }
