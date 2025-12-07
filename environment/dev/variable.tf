variable "resource_group" {
    type = map(object({
name = string
location = string
tags = optional(map(string))
managed_by = optional(string)
}))
}
variable "todomysqlserver01" {
    type = map(object({
        name                         = string
  resource_group_name          = string
  location                     = string
  version                      = string 
  administrator_login          = optional(string)
  administrator_login_password = optional(string)
  minimum_tls_version          = optional(number)
  public_network_access_enabled = optional(bool)
  outbound_network_restriction_enabled = optional(bool)

azuread_administrator = optional(map(object({
    login_username = string
    object_id = string
    tenant_id = optional(string)
  })))

identity  = optional(list(object({
type = string
identity_ids = optional(string)
})))
}))
}

variable "sql_database" {
  type = map(object({
    name        = string
    server_key  = string
    max_size_gb = optional(string)
    sku_name    = optional(string)
    collation   = optional(string)
  }))
}

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
    enable_rbac_authorization   = optional(bool)
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
# variable "server_ids" {
#   type = map(string)
# }

