# GZRS storage accounts for statements + tokenisation vault (geo-redundant).
resource "azurerm_storage_account" "statements" {
  provider                 = azurerm.eastus
  name                     = "ledgerxstmt${var.env}"
  resource_group_name      = azurerm_resource_group.eastus.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GZRS"
  account_kind             = "StorageV2"
  blob_properties {
    versioning_enabled = true
    delete_retention_policy { days = 90 }
  }
  min_tls_version = "TLS1_2"
}

resource "azurerm_storage_account" "tokenisation_vault" {
  provider                 = azurerm.eastus
  name                     = "ledgerxtok${var.env}"
  resource_group_name      = azurerm_resource_group.eastus.name
  location                 = "eastus"
  account_tier             = "Premium"
  account_replication_type = "ZRS"
  account_kind             = "BlockBlobStorage"
  min_tls_version          = "TLS1_2"
  is_hns_enabled           = true
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}
