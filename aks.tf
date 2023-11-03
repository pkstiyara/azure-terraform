

#########################################################
esource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

########################################################
#                   AKS Cluster
########################################################

resource "azurerm_kubernetes_cluster" "myaks" {
    location = azurerm_resource_group.aks_rg.location
    name = var.aks_cluster_name
    resource_group_name = azurerm_resource_group.aks_rg.name
    dns_prefix = random_pet.azurerm_kubernetes_cluster_dns_prefix.id
}


  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }