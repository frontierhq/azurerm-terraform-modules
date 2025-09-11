resource "azurerm_container_registry" "main" {
  name                = "cr0${var.zone}0${var.environment}0${lookup(local.short_locations, var.location)}0${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  sku                           = var.sku

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_container_registry.main.id
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
