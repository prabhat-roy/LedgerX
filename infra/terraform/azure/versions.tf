terraform {
  required_version = ">= 1.6"
  required_providers {
    azurerm    = { source = "hashicorp/azurerm", version = "~> 3.100" }
    helm       = { source = "hashicorp/helm", version = "~> 2.13" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.27" }
  }
  backend "azurerm" {
    resource_group_name  = "ledgerx-tf-state"
    storage_account_name = "ledgerxtfstate"
    container_name       = "tfstate"
    key                  = "azure/prod/terraform.tfstate"
  }
}

provider "azurerm" { features {}, alias = "eastus" }
provider "azurerm" { features {}, alias = "westeurope" }
provider "azurerm" { features {}, alias = "centralindia" }
