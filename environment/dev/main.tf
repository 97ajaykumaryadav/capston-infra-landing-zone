locals { 
  common_tags = {
   "managed_by" = "terraform"
    "Owner" = "ajay"
    "environment" = "dev"
}
}

module "rg" {
  source = "../../modules/azurerm_resource_group"
  resource_group = var.resource_group
}

module "aks" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_aks"
  aks_name = "aks-dev-cin-001"
   resource_group_name = "rg-capston-dev-cin-001"
  location = "central india"
  dns_prefix = "aks-dev-todoapp"
  tags = local.common_tags
}
module "acr" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_container_registry"
  acr_name = "acrcapstondevcin"
     resource_group_name = "rg-capston-dev-cin-001"
  location = "central india"
  tags = local.common_tags

}
module "key_vault" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}
module "sql_server" {
  depends_on = [ module.rg, module.key_vault ]
  source = "../../modules/azurerm_sql_server"
  todomysqlserver01 = var.todomysqlserver01
 
}
module "sql_database" {
  source = "../../modules/azurerm_sql_database"
  sql_database = var.sql_database
  server_ids = module.sql_server.server_ids
}

