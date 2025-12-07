resource "azurerm_resource_group" "rg" {
  for_each     = var.resource_group
  name         = each.value.name
  location     = each.value.location
  tags         = each.value.tags == null ? {} : each.value.tags
  managed_by   = each.value.managed_by == null ? "terraform" : each.value.managed_by
}