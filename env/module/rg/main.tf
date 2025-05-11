resource "azurerm_resource_group" "abc1" {
    for_each = var.rg
  name     = each.value.resource_group_name
  location = each.value.location
}




