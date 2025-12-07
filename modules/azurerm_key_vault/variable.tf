variable "key_vaults" {
  description = "Map of Key Vault configurations"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    tenant_id                   = string
    sku_name                    = string
    enabled_for_disk_encryption = optional(bool)
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    access_policies = optional(list(object({
      tenant_id                = optional(string)
      object_id                = optional(string)
      key_permissions          = optional(list(string))
      secret_permissions       = optional(list(string))
      certificate_permissions  = optional(list(string))
      storage_permissions      = optional(list(string))
    })))
    tags = optional(map(string))
  }))
}
