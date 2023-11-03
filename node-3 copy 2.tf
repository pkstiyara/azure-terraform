



############################################################
#                 Public IP Address 
############################################################
resource "azurerm_public_ip" "node_3_public_ip" {
  name = "node_3_vm-public-ip"
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method = "Dynamic"
  
}

data "azurerm_public_ip" "node_3_vm_ip" {
  name                = azurerm_public_ip.node_3_public_ip.name
  resource_group_name = azurerm_resource_group.aks_rg.name
}

##############################################################
#                 Network Interface
##############################################################

resource "azurerm_network_interface" "node-3_nic" {
  name                = "node_3_nic"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  ip_configuration {
    name                          = "node-3"
    subnet_id                     = azurerm_subnet.main_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.node_3_public_ip.id
  }
}

##################################################################
#                     Virtual Machine
##################################################################


resource "azurerm_linux_virtual_machine" "node-3" {
  name                = "BitbucketNode3"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  size                = "Standard_D2s_v3"
  disable_password_authentication = false
  admin_username      = "azure"
  admin_password = "Password@123!"
  network_interface_ids = [
    azurerm_network_interface.node-3_nic.id,
  ]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

##########################################################################
