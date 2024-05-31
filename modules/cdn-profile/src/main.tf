resource "azurerm_cdn_profile" "main" {
  name                = "cdn-${var.zone}-${var.environment}-${local.location}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = local.location

  sku = var.sku

  tags = merge(var.tags, local.tags)
}

// TODO: Diag settings?
