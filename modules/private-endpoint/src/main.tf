resource "azurerm_private_endpoint" "main" {
  name                = "pe-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "main"
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_id != null ? [{}] : []
    content {
      name                 = "main"
      private_dns_zone_ids = [var.private_dns_zone_id]
    }
  }

  tags = merge(var.tags, local.tags)
}
