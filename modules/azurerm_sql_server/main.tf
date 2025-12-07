
resource "azurerm_mssql_server" "tosqlserver" {
  for_each                             = var.todomysqlserver01
  name                                 = each.value.name
  resource_group_name                  = each.value.resource_group_name
  location                             = each.value.location
  version                              = each.value.version
  administrator_login                  = lookup(each.value, "administrator_login", null)
  administrator_login_password         = lookup(each.value, "administrator_login_password", null)
  minimum_tls_version                  = lookup(each.value, "minimum_tls_version", 1.2)
  public_network_access_enabled        = lookup(each.value, "public_network_access_enabled", true)
  outbound_network_restriction_enabled = lookup(each.value, "outbound_network_restriction_enabled", false)

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator == null ? {} : each.value.azuread_administrator
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
      tenant_id      = lookup(azuread_administrator.value, "tenant_id", null)
    }
  }
  dynamic "identity" {
    for_each = each.value.identity == null ? [] : each.value.identity
    content {
      type         = identity.value.type
      identity_ids = lookup(identity.value, "identity_ids", "SystemAssigned")
    }

  }

}

output "server_ids" {
  value = {
    for k, v in azurerm_mssql_server.tosqlserver : k => v.id
  }
}

