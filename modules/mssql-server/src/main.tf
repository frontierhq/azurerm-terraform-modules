resource "azurerm_mssql_server" "main" {
  name                = "mssql-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  minimum_tls_version          = var.minimum_tls_version
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password

  identity {
    type = "SystemAssigned"
  }

  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator != null ? [{}] : []
    content {
      azuread_authentication_only = var.azuread_administrator.azuread_authentication_only
      login_username              = var.azuread_administrator.login_username
      object_id                   = var.azuread_administrator.object_id
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                           = "log-analytics"
  target_resource_id             = azurerm_mssql_server.main.id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = "AzureDiagnostics"

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
