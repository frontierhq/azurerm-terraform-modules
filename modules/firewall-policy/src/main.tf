resource "azurerm_firewall_policy" "main" {
  name                = "fwpol-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  base_policy_id = var.base_policy_id
  sku            = var.sku

  dynamic "dns" {
    for_each = var.dns != null ? [var.dns] : []
    content {
      proxy_enabled = dns.value.proxy_enabled
      servers       = dns.value.servers
    }
  }

  tags = merge(var.tags, local.tags)
}
