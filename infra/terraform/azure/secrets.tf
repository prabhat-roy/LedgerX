# Per-service Key Vault secrets, replicated via Key Vault built-in geo-replication.
resource "azurerm_key_vault" "secrets" {
  provider                  = azurerm.eastus
  name                      = "ledgerx-secrets-${var.env}"
  location                  = azurerm_resource_group.eastus.location
  resource_group_name       = azurerm_resource_group.eastus.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  soft_delete_retention_days = 30
  purge_protection_enabled   = true
  enable_rbac_authorization  = true
}

resource "azurerm_key_vault_secret" "ledger_service_db" {
  name         = "ledger-service-db"
  value        = random_password.pg.result
  key_vault_id = azurerm_key_vault.secrets.id
}
