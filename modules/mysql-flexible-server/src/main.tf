resource "azurerm_mysql_flexible_server" "main" {

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = var.backup_retention_days
  location               = var.location
  name                   = "mysql-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name    = var.resource_group_name
  sku_name               = var.sku_name

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                           = "log-analytics"
  target_resource_id             = azurerm_mysql_flexible_server.main.id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = "AzureDiagnostics"

  dynamic "enabled_log" {
    for_each = var.log_categories

    content {
      category = enabled_log.value

      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories

    content {
      category = metric.value

      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }
}
