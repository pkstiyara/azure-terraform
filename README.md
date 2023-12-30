# azure-terraform
Azure-teraform


Create a terraform.tfvars file and provide below details

client_secret    = ""
client_id        = ""
tenant_id        = ""
subscription_id  = ""

resource_group_name = ""
location = ""

azurerm_virtual_network_name = "my_vm_vnet"


# To import existing resource in terraform 
 -- terraform import azurerm_resource_group.aks_rg Subscription ID with Group details ( to get that go to azure cloud shell and run az group list)

 To get subscription run this on azure cloud shell- az group list --output json | jq -r '.[].id'

 <!-- #################################################
 # terraform.tfvars

 client_secret    = "vfn8Q~lPg8IRpmsgG7J.1XxFWFjErD6568wEVbBN"
client_id        = "863efcbb-4e60-4633-a167-5d06df8893f1"
tenant_id        = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
subscription_id  = "9734ed68-621d-47ed-babd-269110dbacb1"

resource_group_name = "1-f42703cd-playground-sandbox"
location = "West US"

azurerm_virtual_network_name = "my_vm_vnet"

#################################################
# Linux- Boot Image

   source_image_reference_publisher = "RedHat"
   source_image_reference_offer = "RHEL"
   source_image_reference_sku = "87-gen2"
   source_image_reference_version = "latest"
  



##################################################
# admin user and password

admin_username = "azure"
admin_password = "Password@123"

##################################################### -->
