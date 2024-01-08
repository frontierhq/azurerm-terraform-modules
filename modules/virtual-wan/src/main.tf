resource "azurerm_virtual_wan" "main" {
  name                = "vwan-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, local.tags)
}
