#We are declaring a new Azure Linux virtual machine resource named "vanshita". 
#This resource block defines the configuration for creating the virtual machine.
resource "azurerm_linux_virtual_machine" "vanshita" {
  name                  = "vanshita-vm"
  resource_group_name   = azurerm_resource_group.vanshita.name
  location              = azurerm_resource_group.vanshita.location
  size                  = "Standard_DS1_v2"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.vanshita.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  provisioner "local-exec" {
    command = "sleep 60"  
  }

  lifecycle {
    ignore_changes = [identity]
  }
}

#We are declaring a new Azure role assignment resource named "vanshita". 
#This resource block defines the configuration for assigning a role to a principal user "Contributor" for a specific scope.
#The purpose of this Terraform block is to assign the "Contributor" to the managed identity of the vm called "vanshita-vm".
#By assigning the "Contributor" role, the virtual machine will have full access permissions to manage all resources within the specified scope.
resource "azurerm_role_assignment" "vanshita" {
  scope                = azurerm_linux_virtual_machine.vanshita.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_linux_virtual_machine.vanshita.identity[0].principal_id
  depends_on           = [azurerm_linux_virtual_machine.vanshita]
}
