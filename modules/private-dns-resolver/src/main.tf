resource "azurerm_private_dns_resolver" "main" {
  name                = "dnsr-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  virtual_network_id = var.virtual_network_id

  tags = merge(var.tags, local.tags)
}

resource "azurerm_subnet" "inbound" {
  count = var.inbound_endpoint_subnet_address_prefix != null ? 1 : 0

  name                 = "inbound-dns"
  resource_group_name  = local.virtual_network_resource_group_name
  virtual_network_name = local.virtual_network_name

  address_prefixes = [var.inbound_endpoint_subnet_address_prefix]

  delegation {
    name = "Microsoft.Network.dnsResolvers"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "main" {
  count = var.inbound_endpoint_subnet_address_prefix != null ? 1 : 0

  name                    = "main"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = var.location

  ip_configurations {
    subnet_id = azurerm_subnet.inbound[0].id
  }
}

resource "azurerm_subnet" "outbound" {
  count = var.outbound_endpoint_subnet_address_prefix != null ? 1 : 0

  name                 = "outbound-dns"
  resource_group_name  = local.virtual_network_resource_group_name
  virtual_network_name = local.virtual_network_name

  address_prefixes = [var.outbound_endpoint_subnet_address_prefix]

  delegation {
    name = "Microsoft.Network.dnsResolvers"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "main" {
  count = var.outbound_endpoint_subnet_address_prefix != null ? 1 : 0

  name                    = "main"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = var.location

  subnet_id = azurerm_subnet.outbound[0].id
}
