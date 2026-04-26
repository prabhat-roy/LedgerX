output "aks_endpoints" {
  value = {
    eastus       = azurerm_kubernetes_cluster.eastus.kube_config.0.host
    westeurope   = azurerm_kubernetes_cluster.westeurope.kube_config.0.host
    centralindia = azurerm_kubernetes_cluster.centralindia.kube_config.0.host
  }
  sensitive = true
}

output "card_data_kv_uri" { value = azurerm_key_vault.card_data.vault_uri }
output "secrets_kv_uri" { value = azurerm_key_vault.secrets.vault_uri }
