resource "azurerm_service_plan" "main" {
  name                = "asp-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name

  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  worker_count                 = var.worker_count
  zone_balancing_enabled       = var.zone_balancing_enabled

  tags = merge(var.tags, local.tags)
}
