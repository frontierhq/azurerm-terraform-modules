resource "azurerm_virtual_network_gateway" "main" {
  name                = "vngw-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku  = var.sku
  type = var.type

  ip_configuration {
    name = "main"

    public_ip_address_id = var.public_ip_address_id
    subnet_id            = var.subnet_id
  }

  dynamic "vpn_client_configuration" {
    for_each = var.type == "Vpn" ? [{}] : []

    content {
      aad_audience         = data.azuread_service_principal.azure_vpn.client_id
      aad_issuer           = "https://sts.windows.net/${data.azurerm_client_config.main.tenant_id}/"
      aad_tenant           = "https://login.microsoftonline.com/${data.azurerm_client_config.main.tenant_id}/"
      address_space        = var.vpn_client_configuration_address_space
      vpn_auth_types       = ["AAD"]
      vpn_client_protocols = ["OpenVPN"]
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_virtual_network_gateway.main.id
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
