resource "azurerm_resource_group" "vanshita" {
  name     = "vanshita-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "vanshita" {
  name                = "vanshita-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vanshita.location
  resource_group_name = azurerm_resource_group.vanshita.name
}

resource "azurerm_subnet" "vanshita" {
  name                 = "vanshita-subnet"
  resource_group_name  = azurerm_resource_group.vanshita.name
  virtual_network_name = azurerm_virtual_network.vanshita.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "vanshita" {
  name                = "vanshita-nic"
  resource_group_name = azurerm_resource_group.vanshita.name
  location            = azurerm_resource_group.vanshita.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vanshita.id
    private_ip_address_allocation = "Dynamic"
  }
}
