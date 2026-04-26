variable "env" { type = string, default = "prod" }

variable "regions" {
  type    = list(string)
  default = ["eastus", "westeurope", "centralindia"]
}

variable "vnet_cidrs" {
  type = map(string)
  default = {
    eastus       = "10.40.0.0/16"
    westeurope   = "10.50.0.0/16"
    centralindia = "10.60.0.0/16"
  }
}

variable "aks_node_min" { default = 3 }
variable "aks_node_max" { default = 30 }
variable "cockroach_nodes_per_region" { default = 3 }
