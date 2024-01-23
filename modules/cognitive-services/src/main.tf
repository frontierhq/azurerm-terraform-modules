resource "azurerm_cognitive_account" "main" {
  name                               = "cog-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  kind                               = var.kind
  location                           = var.location
  resource_group_name                = var.resource_group_name
  sku_name                           = var.sku_name
  custom_subdomain_name              = var.custom_subdomain_name
  dynamic_throttling_enabled         = var.dynamic_throttling_enabled
  fqdns                              = var.fqdns
  local_auth_enabled                 = var.local_auth_enabled
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = var.public_network_access_enabled

  tags = merge(local.tags, var.tags)

  network_acls {
    default_action = var.default_action
    ip_rules       = var.ip_rules

    dynamic "virtual_network_rules" {
      for_each = var.virtual_network_rules
      content {
        subnet_id                            = virtual_network_rules.value.subnet_id
        ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
      }
    }
  }

  dynamic "storage" {
    for_each = var.storage
    content {
      storage_account_id = storage.value.storage_account_id
      identity_client_id = storage.value.identity_client_id
    }
  }

  identity {
    type         = var.identity_ids == null ? "SystemAssigned" : "SystemAssigned, UserAssigned"
    identity_ids = var.identity_ids
  }
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_cognitive_account.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = var.log_category_groups

    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories

    content {
      category = metric.value
    }
  }
}
