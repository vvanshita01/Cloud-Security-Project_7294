resource "azurerm_storage_account" "vanshita" {
  name                     = "vanshitastorage"
  resource_group_name      = azurerm_resource_group.vanshita.name
  location                 = azurerm_resource_group.vanshita.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

