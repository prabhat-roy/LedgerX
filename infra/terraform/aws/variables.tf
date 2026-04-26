variable "env" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "prod"
}

variable "regions" {
  description = "Active-active regions for LedgerX on AWS"
  type        = list(string)
  default     = ["us-east-1", "eu-west-1", "ap-south-1"]
}

variable "vpc_cidrs" {
  description = "VPC CIDR per region"
  type        = map(string)
  default = {
    "us-east-1" = "10.10.0.0/16"
    "eu-west-1" = "10.20.0.0/16"
    "ap-south-1" = "10.30.0.0/16"
  }
}

variable "eks_node_min" { default = 3 }
variable "eks_node_max" { default = 30 }
variable "cockroach_nodes_per_region" { default = 3 }
