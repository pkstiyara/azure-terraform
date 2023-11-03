
############################################################################
#   Authorization and Authentication 
############################################################################

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

#######################################################################
#                       VM TYPES and USER LOGIN Details
#######################################################################
variable "vm_types" {
  type = string  
}

variable "admin_username" {
  type = string  
}

variable "admin_password" {
  type = string
}


#######################################################################
#                 NODE - 1 VARS
#######################################################################
variable "node_1_public_ip" {
  type = string  
}

variable "node_1_nic" {
  type = string  
}

variable "nic_ip_name_node_1" {
  type = string  
}

variable "vm_name_node_1" {
  type = string  
}


#######################################################################
#                 NODE - 2 VARS
#######################################################################
variable "node_2_public_ip" {
  type = string  
}

variable "node_2_nic" {
  type = string  
}

variable "nic_ip_name_node_2" {
  type = string  
}

variable "vm_name_node_2" {
  type = string  
}

#######################################################################
#                 NODE - 3 VARS
#######################################################################
variable "node_3_public_ip" {
  type = string  
}

variable "node_3_nic" {
  type = string  
}

variable "nic_ip_name_node_3" {
  type = string  
}

variable "vm_name_node_3" {
  type = string  
}


#######################################################################
#                 NODE - 4 VARS
#######################################################################
variable "node_4_public_ip" {
  type = string  
}

variable "node_4_nic" {
  type = string  
}

variable "nic_ip_name_node_4" {
  type = string  
}

variable "vm_name_node_4" {
  type = string  
}


#######################################################################
#                 NODE - 5 VARS
#######################################################################
variable "node_5_public_ip" {
  type = string  
}

variable "node_5_nic" {
  type = string  
}

variable "nic_ip_name_node_5" {
  type = string  
}

variable "vm_name_node_5" {
  type = string  
}
