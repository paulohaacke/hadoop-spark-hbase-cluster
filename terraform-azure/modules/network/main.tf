resource "azurerm_resource_group" "hadoop" {
  name     = "hadoop-tsd"
  location = "East US"
}

resource "azurerm_virtual_network" "hadoop" {
  name                = "hadoop-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hadoop.location
  resource_group_name = azurerm_resource_group.hadoop.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "hadoop-subnet"
  resource_group_name  = azurerm_resource_group.hadoop.name
  virtual_network_name = azurerm_virtual_network.hadoop.name
  address_prefixes     = ["10.0.2.0/24"]
}
