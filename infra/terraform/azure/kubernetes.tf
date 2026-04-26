# Three AKS clusters — one per region, active-active.
resource "azurerm_kubernetes_cluster" "eastus" {
  provider            = azurerm.eastus
  name                = "ledgerx-eastus"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.eastus.name
  dns_prefix          = "ledgerx-eastus"
  kubernetes_version  = "1.29"

  default_node_pool {
    name                = "system"
    node_count          = var.aks_node_min
    vm_size             = "Standard_D8s_v5"
    enable_auto_scaling = true
    min_count           = var.aks_node_min
    max_count           = var.aks_node_max
    zones               = ["1", "2", "3"]
    only_critical_addons_enabled = true
  }

  identity { type = "SystemAssigned" }

  workload_identity_enabled = true
  oidc_issuer_enabled       = true

  azure_policy_enabled = true
  network_profile {
    network_plugin = "azure"
    network_policy = "cilium"
  }
}

resource "azurerm_kubernetes_cluster" "westeurope" {
  provider            = azurerm.westeurope
  name                = "ledgerx-westeurope"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.westeurope.name
  dns_prefix          = "ledgerx-westeurope"
  kubernetes_version  = "1.29"
  default_node_pool {
    name                = "system"
    node_count          = var.aks_node_min
    vm_size             = "Standard_D8s_v5"
    enable_auto_scaling = true
    min_count           = var.aks_node_min
    max_count           = var.aks_node_max
    zones               = ["1", "2", "3"]
    only_critical_addons_enabled = true
  }
  identity { type = "SystemAssigned" }
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}

resource "azurerm_kubernetes_cluster" "centralindia" {
  provider            = azurerm.centralindia
  name                = "ledgerx-centralindia"
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.centralindia.name
  dns_prefix          = "ledgerx-centralindia"
  kubernetes_version  = "1.29"
  default_node_pool {
    name                = "system"
    node_count          = var.aks_node_min
    vm_size             = "Standard_D8s_v5"
    enable_auto_scaling = true
    min_count           = var.aks_node_min
    max_count           = var.aks_node_max
    zones               = ["1", "2", "3"]
    only_critical_addons_enabled = true
  }
  identity { type = "SystemAssigned" }
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}
