resource "azurerm_point_to_site_vpn_gateway" "main" {
  name                = "p2svpngw-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_servers                 = var.dns_servers
  scale_unit                  = var.scale_unit
  virtual_hub_id              = var.virtual_hub_id
  vpn_server_configuration_id = var.vpn_server_configuration_id

  connection_configuration {
    name = "main"

    vpn_client_address_pool {
      address_prefixes = var.vpn_client_address_pool_address_prefixes
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_point_to_site_vpn_gateway.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = var.log_categories

    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_log" {
    for_each = var.log_category_groups

    content {
      category_group = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories

    content {
      category = metric.value
    }
  }
}
