
variable "client_secret" {
  description = "Azure service principal client secret"
  type        = string
  sensitive   = true
}

variable "client_id" {
    description = "CLient Secret ID"
    type = string
    sensitive = false
}

variable "tenant_id" {
    description = "tenant ID"
    type = string
      
}

variable "subscription_id" {
    description = "Subscription ID"
    type = string  
}

######################################################################

variable "resource_group_name" {
  type = string
    
}

variable "location" {
  type = string
}


#######################################################################

variable "azurerm_virtual_network_name" {
  type = string
}


###################################################################
variable "admin_username" {
  type = string
  default = "azure"
}

variable "admin_password" {
  type = string
  default = "Password@123!"
  
}


# Boot Image
  variable "source_image_reference_publisher" {
    type = string    
    default = "Canonical"
  }

variable "source_image_reference_offer" {
  type = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "source_image_reference_sku" {
  type = string
  default = "22_04-lts"
}

variable "source_image_reference_version" {
  type = string
  default = "latest"  
}
