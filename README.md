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


 Added some more varaiables

 # Resource Group details
resource_group_name = "1-c737e107-playground-sandbox"
location = "South Central US"

# Networking

azurerm_virtual_network_name = "my_vm_vnet"

# aks_cluster_name = "myCluster"
# node_count = 3

vm_types                = "Standard_D2s_v3"
admin_username          = "azureadmin"
admin_password          = "Password@123!"

node_1_public_ip = "public-ip_node-1"
node_1_nic = "nic-node-1"
nic_ip_name_node_1 = "ip-node-1"
vm_name_node_1 = "VM-1"


##########################################################
#               Node 2
##########################################################

node_2_public_ip = "public-ip_node-2"
node_2_nic = "nic-node-2"
nic_ip_name_node_2 = "ip-node-2"
vm_name_node_2 = "VM-2"



##########################################################
#               Node 3
##########################################################

node_3_public_ip = "public-ip_node-3"
node_3_nic = "nic-node-3"
nic_ip_name_node_3 = "ip-node-3"
vm_name_node_3 = "VM-3"

##########################################################
#               Node 4
##########################################################

node_4_public_ip = "public-ip_node-4"
node_4_nic = "nic-node-4"
nic_ip_name_node_4 = "ip-node-4"
vm_name_node_4 = "VM-4"



##########################################################
#               Node 5
##########################################################

node_5_public_ip = "public-ip_node-5"
node_5_nic = "nic-node-5"
nic_ip_name_node_5 = "ip-node-5"
vm_name_node_5= "VM-5"
