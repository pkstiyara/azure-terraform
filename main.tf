
#########################################################
#               Resource Group 
#########################################################

resource "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
  location = var.location
}
#########################################################
#           Virtual Network
#########################################################

resource "azurerm_virtual_network" "main_vnet" {
  name = var.azurerm_virtual_network_name
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name  
}

##########################################################
#           Subnet 
##########################################################

resource "azurerm_subnet" "main_subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

##############################################################
#                 Network Interface
##############################################################

resource "azurerm_network_interface" "vm_nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_public_ip.id
  }
}

############################################################
#                 Public IP Address 
############################################################
resource "azurerm_public_ip" "vm_public_ip" {
  name = "vm-public-ip"
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method = "Dynamic"
  
}

data "azurerm_public_ip" "vm_ip" {
  name                = azurerm_public_ip.vm_public_ip.name
  resource_group_name = azurerm_resource_group.aks_rg.name
}

################################################################
#                       Network Secuirty Group
################################################################

# resource "azurerm_network_security_group" "az_nsg" {
#   name                = "acceptanceTestSecurityGroup1"
#   location            = azurerm_resource_group.aks_rg.location
#   resource_group_name = azurerm_resource_group.aks_rg.name

#   security_rule {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   tags = {
#     environment = "Production"
#   }
# }



##################################################################
#                     Virtual Machine
##################################################################


resource "azurerm_linux_virtual_machine" "main_vm" {
  name                = "JenkinsMaster"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  size                = "Standard_D2s_v3"
  disable_password_authentication = false
  admin_username      = "azure"
  admin_password = "Password@123!"
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
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