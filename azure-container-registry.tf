resource "azurerm_resource_group" "resource_gp" {
  name     = "loadbalancer-v1"
  location = "Central India"
}

resource "azurerm_container_registry" "acr" {
  name                = "weya-fastapi-rg"
  resource_group_name = azurerm_resource_group.resource_gp.name
  location            = azurerm_resource_group.resource_gp.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}   