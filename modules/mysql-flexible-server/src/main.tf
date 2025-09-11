resource "azurerm_mysql_flexible_server" "main" {
  name                = "mysql-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = var.backup_retention_days
  sku_name               = var.sku_name

  tags = merge(var.tags, local.tags)

  lifecycle {
    ignore_changes = [
      zone,
    ]
  }
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_access_to_azure_services" {
  count = var.allow_access_to_azure_services ? 1 : 0

  name                = "allow_access_to_azure_services"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azapi_update_resource" "main" {
  type        = "Microsoft.DBforMySQL/flexibleServers@2023-06-01-preview"
  resource_id = azurerm_mysql_flexible_server.main.id

  body = {
    properties = {
      network = {
        publicNetworkAccess = var.public_network_access ? "Enabled" : "Disabled"
      }
    }
  }

  depends_on = [
    azurerm_mysql_flexible_server.main,
  ]
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_mysql_flexible_server.main.id
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
