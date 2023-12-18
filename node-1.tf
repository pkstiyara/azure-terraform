

############################################################
#                 Public IP Address 
############################################################
resource "azurerm_public_ip" "node_1_public_ip" {
  name = "node_1_vm-public-ip"
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method = "Dynamic"
  
}

data "azurerm_public_ip" "node_1_vm_ip" {
  name                = azurerm_public_ip.node_1_public_ip.name
  resource_group_name = azurerm_resource_group.aks_rg.name
}

##############################################################
#                 Network Interface
##############################################################

resource "azurerm_network_interface" "node-1_nic" {
  name                = "node_1_nic"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  ip_configuration {
    name                          = "node-1"
    subnet_id                     = azurerm_subnet.main_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.node_1_public_ip.id
  }
}

##################################################################
#                     Virtual Machine
##################################################################


resource "azurerm_linux_virtual_machine" "node-1" {
  name                = "BitbucketNode1"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  size                = "Standard_D2s_v3"
  disable_password_authentication = false
  admin_username      = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.node-1_nic.id,
  ]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }
}

##########################################################################
