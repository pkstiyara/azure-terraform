
# resource "azurerm_storage_account" "bitbucket_shared_storage" {
#   name                     = "pksbitbucketstore"
#   resource_group_name      = azurerm_resource_group.aks_rg.name
#   location                 = azurerm_resource_group.aks_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


# resource "azurerm_storage_share" "Bitbucket_share" {
#     storage_account_name = azurerm_storage_account.bitbucket_shared_storage.name
#     depends_on = [ azurerm_storage_account.bitbucket_shared_storage ]
#     quota = 100
#     name = "bitbucket-shared-home"
  
# }