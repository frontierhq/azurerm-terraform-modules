resource "azurerm_postgresql_flexible_server" "main" {
  name                = "pgfs-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  sku_name               = var.sku_name
  storage_mb             = var.storage_mb
  version                = var.postgres_version

  dynamic "high_availability" {
    for_each = var.high_availability_mode != null ? [{}] : []

    content {
      mode = var.high_availability_mode
    }
  }

  tags = merge(var.tags, local.tags)

  lifecycle {
    ignore_changes = [
      high_availability.0.standby_availability_zone,
      zone,
    ]
  }
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_postgresql_flexible_server.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"
  }

  metric {
    category = "AllMetrics"
  }
}
