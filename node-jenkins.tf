

############################################################
#                 Public IP Address 
############################################################
resource "azurerm_public_ip" "node_jenkins_public_ip" {
  name = "node_jenkins_vm-public-ip"
  location = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method = "Dynamic"
  
}

data "azurerm_public_ip" "node_jenkins_vm_ip" {
  name                = azurerm_public_ip.node_jenkins_public_ip.name
  resource_group_name = azurerm_resource_group.aks_rg.name
}

##############################################################
#                 Network Interface
##############################################################

resource "azurerm_network_interface" "node-jenkins_nic" {
  name                = "node_jenkins_nic"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  ip_configuration {
    name                          = "node-jenkins"
    subnet_id                     = azurerm_subnet.main_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.node_jenkins_public_ip.id
  }
}

#################################################################
#               NSG 
#################################################################
resource "azurerm_network_security_group" "node_jenkins_nsg" {
  name                = "node_jenkins_nsg"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#################################################################
#               NSG Association (New NSG)
#################################################################
resource "azurerm_network_interface_security_group_association" "node_jenkins_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.node-jenkins_nic.id
  network_security_group_id = azurerm_network_security_group.node_jenkins_nsg.id
}
##################################################################
#                     Virtual Machine
##################################################################


resource "azurerm_linux_virtual_machine" "node-jenkins" {
  name                = "Jenkins-Node"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  size                = "Standard_D2s_v3"
  disable_password_authentication = false
  admin_username      = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.node-jenkins_nic.id,
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

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello World' > /tmp/hello.txt",
      "sudo yum update -y",
      "sudo yum install git -y",
    ]

    connection {
      type        = "ssh"
      host        = azurerm_linux_virtual_machine.node-jenkins.public_ip_address
      user        = var.admin_username
      password    = var.admin_password
      agent       = false
      
    }
  }
}

##########################################################################
