



############################################################
#                 Public IP Address 
############################################################
resource "azurerm_public_ip" "node_5_public_ip" {
  name = var.node_5_public_ip
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method = "Dynamic"
  
}

data "azurerm_public_ip" "node_5_vm_ip" {
  name                = azurerm_public_ip.node_4_public_ip.name
  resource_group_name = azurerm_resource_group.aks_rg.name
}

##############################################################
#                 Network Interface
##############################################################

resource "azurerm_network_interface" "node-5_nic" {
  name                = var.node_5_public_ip
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  ip_configuration {
    name                          = var.nic_ip_name_node_5
    subnet_id                     = azurerm_subnet.main_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.node_5_public_ip.id
  }
}

##################################################################
#                     Virtual Machine
##################################################################


resource "azurerm_linux_virtual_machine" "node-5" {
  name                = var.vm_name_node_5
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  size                = var.vm_types
  disable_password_authentication = false
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.node-5_nic.id,
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
