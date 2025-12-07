resource "azurerm_mssql_database" "dev-01-sql_database" {
  for_each       = var.sql_database
  name           = each.value.name
  server_id      = var.server_ids[each.value.server_key]
  collation      = lookup(each.value, "collation", "SQL_Latin1_General_CP1_CI_AS")
  license_type   = "LicenseIncluded"
  max_size_gb    = lookup(each.value, "max_size_gb", 1)
  read_scale = lookup(each.value, "read_scale", false)
  sku_name       = lookup(each.value, "sku_name", "S0")
  zone_redundant = false
  enclave_type   = "VBS"
}
