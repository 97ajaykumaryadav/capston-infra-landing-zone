variable "sql_database" {
  type = map(object({
    name        = string
    server_key  = string
    max_size_gb = optional(string)
    sku_name    = optional(string)
    collation   = optional(string)
  }))
}
variable "server_ids" {
  type = map(string)
}
