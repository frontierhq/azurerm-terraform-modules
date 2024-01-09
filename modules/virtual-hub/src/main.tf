resource "azurerm_virtual_hub" "main" {
  name                = "vhub-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  address_prefix         = var.address_prefix
  hub_routing_preference = var.hub_routing_preference
  sku                    = var.sku
  virtual_wan_id         = var.virtual_wan_id

  tags = merge(var.tags, local.tags)
}
