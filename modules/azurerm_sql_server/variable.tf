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

  

  
