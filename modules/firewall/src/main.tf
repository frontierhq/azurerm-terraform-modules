resource "azurerm_firewall" "main" {
  name                = "fw-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  firewall_policy_id = var.firewall_policy_id
  sku_name           = var.sku_name
  sku_tier           = var.sku_tier

  dynamic "virtual_hub" {
    for_each = var.virtual_hub_id != null ? [{}] : []

    content {
      virtual_hub_id = var.virtual_hub_id
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_firewall.main.id
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
