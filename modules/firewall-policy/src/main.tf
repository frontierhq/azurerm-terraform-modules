resource "azurerm_firewall_policy" "main" {
  name                = "fwpol-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  base_policy_id = var.base_policy_id

  sku = var.sku

  dynamic "dns" {
    for_each = length(var.dns_servers) > 0 ? [{}] : []

    content {
      proxy_enabled = true
      servers       = var.dns_servers
    }
  }

  tags = merge(var.tags, local.tags)
}
