resource "azurerm_linux_web_app" "main" {
  name                = "web-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  https_only          = var.https_only
  tags                = merge(var.tags, local.tags)

  app_settings            = merge(local.app_settings, var.app_settings)
  client_affinity_enabled = var.client_affinity_enabled

  site_config {
    container_registry_managed_identity_client_id = var.site_config.container_registry_managed_identity_client_id
    container_registry_use_managed_identity       = var.site_config.container_registry_use_managed_identity
    ftps_state                                    = var.site_config.ftps_state
    http2_enabled                                 = var.site_config.http2_enabled
    use_32_bit_worker                             = var.site_config.use_32_bit_worker
    vnet_route_all_enabled                        = var.site_config.vnet_route_all_enabled
    websockets_enabled                            = var.site_config.websockets_enabled
    worker_count                                  = var.site_config.worker_count

    application_stack {
      docker_image_name   = local.application_stack["docker_image"]
      dotnet_version      = local.application_stack["dotnet_version"]
      go_version          = local.application_stack["go_version"]
      java_server         = local.application_stack["java_server"]
      java_server_version = local.application_stack["java_server_version"]
      java_version        = local.application_stack["java_version"]
      php_version         = local.application_stack["php_version"]
      python_version      = local.application_stack["python_version"]
      node_version        = local.application_stack["node_version"]
      ruby_version        = local.application_stack["ruby_version"]
    }
  }

  logs {
    detailed_error_messages = var.logs.detailed_error_messages
    failed_request_tracing  = var.logs.failed_request_tracing
    http_logs {
      file_system {
        retention_in_days = var.logs.retention_in_days
        retention_in_mb   = var.logs.retention_in_mb
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
  target_resource_id         = azurerm_linux_web_app.main.id
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
