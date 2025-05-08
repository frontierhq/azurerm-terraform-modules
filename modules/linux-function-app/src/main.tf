resource "azurerm_linux_function_app" "main" {
  name                        = "fn-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = var.service_plan_id
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  functions_extension_version = var.functions_extension_version
  https_only                  = true
  app_settings                = var.app_settings
  client_certificate_enabled  = var.client_certificate_enabled
  client_certificate_mode     = var.client_certificate_mode

  client_certificate_exclusion_paths = var.client_certificate_exclusion_paths
  virtual_network_subnet_id          = var.virtual_network_subnet_id

  tags = merge(var.tags, local.tags)

  site_config {
    application_stack {
      dotnet_version              = local.application_stack.dotnet_version
      java_version                = local.application_stack.java_version
      node_version                = local.application_stack.node_version
      powershell_core_version     = local.application_stack.powershell_core_version
      python_version              = local.application_stack.python_version
      use_custom_runtime          = local.application_stack.use_custom_runtime
      use_dotnet_isolated_runtime = local.application_stack.use_dotnet_isolated_runtime
    }
    application_insights_connection_string = var.application_insights_connection_string
    application_insights_key               = var.application_insights_key
    always_on                              = var.always_on
    ftps_state                             = "Disabled"
    vnet_route_all_enabled                 = var.vnet_route_all_enabled

    dynamic "ip_restriction" {
      for_each = var.ip_restriction
      content {
        action                    = ip_restriction.value.action
        ip_address                = ip_restriction.value.ip_address
        name                      = ip_restriction.value.name
        priority                  = ip_restriction.value.priority
        service_tag               = ip_restriction.value.service_tag
        virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_linux_function_app.main.id
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
