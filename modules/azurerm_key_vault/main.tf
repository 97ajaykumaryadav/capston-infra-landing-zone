resource "azurerm_key_vault" "key_vault" {
  for_each = var.key_vaults

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  sku_name                    = each.value.sku_name
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", true)
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", true)

  dynamic "access_policy" {
    for_each = lookup(each.value, "access_policies", [])
    content {
      tenant_id = lookup(access_policy.value, "tenant_id", each.value.tenant_id)
      object_id = lookup(access_policy.value, "object_id", null)

      key_permissions          = lookup(access_policy.value, "key_permissions", [])
      secret_permissions       = lookup(access_policy.value, "secret_permissions", [])
      certificate_permissions  = lookup(access_policy.value, "certificate_permissions", [])
      storage_permissions      = lookup(access_policy.value, "storage_permissions", [])
    }
  }

  tags = lookup(each.value, "tags", {})
}


