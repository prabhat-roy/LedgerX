# Three regional VNets + Virtual WAN hub for active-active mesh routing.
resource "azurerm_resource_group" "eastus" {
  provider = azurerm.eastus
  name     = "ledgerx-eastus-${var.env}"
  location = "eastus"
}

resource "azurerm_resource_group" "westeurope" {
  provider = azurerm.westeurope
  name     = "ledgerx-westeurope-${var.env}"
  location = "westeurope"
}

resource "azurerm_resource_group" "centralindia" {
  provider = azurerm.centralindia
  name     = "ledgerx-centralindia-${var.env}"
  location = "centralindia"
}

resource "azurerm_virtual_network" "eastus" {
  provider            = azurerm.eastus
  name                = "ledgerx-vnet-eastus"
  address_space       = [var.vnet_cidrs["eastus"]]
  location            = azurerm_resource_group.eastus.location
  resource_group_name = azurerm_resource_group.eastus.name
}

resource "azurerm_virtual_network" "westeurope" {
  provider            = azurerm.westeurope
  name                = "ledgerx-vnet-westeurope"
  address_space       = [var.vnet_cidrs["westeurope"]]
  location            = azurerm_resource_group.westeurope.location
  resource_group_name = azurerm_resource_group.westeurope.name
}

resource "azurerm_virtual_network" "centralindia" {
  provider            = azurerm.centralindia
  name                = "ledgerx-vnet-centralindia"
  address_space       = [var.vnet_cidrs["centralindia"]]
  location            = azurerm_resource_group.centralindia.location
  resource_group_name = azurerm_resource_group.centralindia.name
}

resource "azurerm_virtual_wan" "ledgerx" {
  provider            = azurerm.eastus
  name                = "ledgerx-vwan"
  resource_group_name = azurerm_resource_group.eastus.name
  location            = "eastus"
}

resource "azurerm_virtual_hub" "eastus" {
  provider            = azurerm.eastus
  name                = "ledgerx-vhub-eastus"
  resource_group_name = azurerm_resource_group.eastus.name
  location            = "eastus"
  virtual_wan_id      = azurerm_virtual_wan.ledgerx.id
  address_prefix      = "10.41.0.0/24"
}
