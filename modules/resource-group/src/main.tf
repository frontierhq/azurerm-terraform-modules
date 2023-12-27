resource "azurerm_resource_group" "main" {
  name     = "rg-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location = var.location

  tags = merge(var.tags, local.tags)
}
