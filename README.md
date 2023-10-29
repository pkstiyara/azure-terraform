# azure-terraform
Azure-teraform


Create a terraform.tfvars file and provide below details

- client_secret    = "your_details"
- client_id        = "your_details""
- tenant_id        = "your_details"
- subscription_id  = "your_details"

- resource_group_name = "1-266a9986-playground-sandbox"
- location = "South Central US"

- azurerm_virtual_network_name = "my_vm_vnet"

# To import existing resource in terraform 
 -- terraform import azurerm_resource_group.aks_rg Subscription ID with Group details ( to get that go to azure cloud shell and run az group list)