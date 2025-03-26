resource "azurerm_public_ip" "main" {
  name                = "pip-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = var.allocation_method
  domain_name_label = var.domain_name_label

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_public_ip.main.id
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
