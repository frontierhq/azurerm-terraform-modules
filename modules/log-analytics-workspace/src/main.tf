resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  retention_in_days = var.retention_in_days
  sku               = var.sku

  tags = merge(var.tags, local.tags)
}
