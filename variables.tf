
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


