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
  aks_name = "k8s-dev-aks"
   resource_group_name = "k8s-dev-rg"
  location = "central india"
  dns_prefix = "aks-dev-todoapp"
  tags = local.common_tags
}
module "acr" {
  source = "../../modules/azurerm_container_registry"
  acr_name = "rk8sacr"
     resource_group_name = "k8s-dev-rg"
  location = "central india"
  tags = local.common_tags

}
module "sql_server" {
  source = "../../modules/azurerm_sql_server"
  todomysqlserver01 = var.todomysqlserver01
 
}
module "sql_database" {
  source = "../../modules/azurerm_sql_database"
  sql_database = var.sql_database
  server_ids = module.sql_server.server_ids
}

