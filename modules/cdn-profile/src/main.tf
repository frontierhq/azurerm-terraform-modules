resource "azurerm_cdn_profile" "main" {
  name                = "cdn-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku = var.sku

  tags = merge(var.tags, local.tags)
}

// TODO: Diag settings?
