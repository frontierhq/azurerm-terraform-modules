resource "azurerm_search_service" "main" {
  name                = "srch-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  replica_count       = var.replica_count
  partition_count     = var.partition_count

  local_authentication_enabled = var.local_authentication_enabled
  authentication_failure_mode  = var.authentication_failure_mode

  allowed_ips                   = var.allowed_ips
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }

  tags = merge(local.tags, var.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_search_service.main.id
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
