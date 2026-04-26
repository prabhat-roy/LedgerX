terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.40" }
    helm = { source = "hashicorp/helm", version = "~> 2.13" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.27" }
  }
  backend "s3" {
    bucket         = "ledgerx-tf-state"
    key            = "aws/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ledgerx-tf-lock"
    encrypt        = true
  }
}

provider "aws" { alias = "use1", region = "us-east-1" }
provider "aws" { alias = "euw1", region = "eu-west-1" }
provider "aws" { alias = "aps1", region = "ap-south-1" }
