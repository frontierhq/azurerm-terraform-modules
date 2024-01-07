resource "azurerm_private_dns_resolver" "main" {
  name                = "dnsr-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  virtual_network_id = var.virtual_network_id

  tags = merge(var.tags, local.tags)
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "main" {
  count = var.inbound_endpoint_subnet_id != null ? 1 : 0

  name                    = "main"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = var.location

  ip_configurations {
    subnet_id = var.inbound_endpoint_subnet_id
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "main" {
  count = var.outbound_endpoint_subnet_id != null ? 1 : 0

  name                    = "main"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = var.location

  subnet_id = var.outbound_endpoint_subnet_id
}
