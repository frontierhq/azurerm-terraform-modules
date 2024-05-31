resource "azurerm_storage_account" "main" {
  name                = "sa0${var.zone}0${var.environment}0${lookup(local.short_locations, var.location)}0${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"

  dynamic "static_website" {
    for_each = var.static_website != null ? [var.static_website] : []
    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_storage_account.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "metric" {
    for_each = var.metric_categories

    content {
      category = metric.value
    }
  }
}
