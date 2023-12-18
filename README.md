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