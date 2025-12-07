resource "azurerm_storage_account" "stgaz" {
    name = var.storage_account_name
    location = var.location
    resource_group_name = var.resource_group_name
    account_replication_type = var.account_replication_type
    account_tier = var.account_tier
    tags = var.tags
  
}