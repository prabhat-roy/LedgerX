# Azure-managed PostgreSQL Flexible Server (per-region) and CockroachDB on AKS.
resource "azurerm_postgresql_flexible_server" "eastus" {
  provider               = azurerm.eastus
  name                   = "ledgerx-pg-eastus-${var.env}"
  resource_group_name    = azurerm_resource_group.eastus.name
  location               = "eastus"
  version                = "15"
  administrator_login    = "ledgerx_admin"
  administrator_password = "${random_password.pg.result}"
  zone                   = "1"
  storage_mb             = 1048576
  sku_name               = "GP_Standard_D4s_v5"
  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "2"
  }
  backup_retention_days = 35
  geo_redundant_backup_enabled = true
}

resource "random_password" "pg" {
  length  = 24
  special = true
}

# Azure Managed HSM for PCI-DSS KEKs.
resource "azurerm_key_vault" "card_data" {
  provider                  = azurerm.eastus
  name                      = "ledgerx-cdata-${var.env}"
  location                  = azurerm_resource_group.eastus.location
  resource_group_name       = azurerm_resource_group.eastus.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "premium"  # HSM-backed
  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  enable_rbac_authorization  = true
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

data "azurerm_client_config" "current" { provider = azurerm.eastus }
