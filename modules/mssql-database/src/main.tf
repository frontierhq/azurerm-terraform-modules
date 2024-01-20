resource "azurerm_mssql_database" "main" {
  name        = "sdb-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  server_id   = var.sql_server_id
  max_size_gb = var.max_size_gb
  sku_name    = var.sql_database_sku
  collation   = var.sql_database_collation

  min_capacity                = var.serverless_min_capacity
  auto_pause_delay_in_minutes = var.serverless_auto_pause_delay

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy != null ? [{}] : []
    content {
      state                      = "Enabled"
      retention_days             = var.threat_detection_policy.retention_days
      email_account_admins       = var.threat_detection_policy.email_account_admins
      email_addresses            = var.threat_detection_policy.security_alert_email_addresses
      storage_account_access_key = var.threat_detection_policy.storage_account_access_key
      storage_endpoint           = var.threat_detection_policy.storage_endpoint
    }
  }

  tags = merge(var.tags, local.tags)

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                           = "log-analytics"
  target_resource_id             = azurerm_mssql_database.main.id
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
