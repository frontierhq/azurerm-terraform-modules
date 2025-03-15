resource "azurerm_kubernetes_cluster" "main" {
  name                = "k8s-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix          = "${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "rg-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}k8snodes"

  azure_policy_enabled = true

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
    azure_rbac_enabled     = true
  }

  default_node_pool {
    name = "system"

    auto_scaling_enabled        = var.auto_scaling_enabled
    max_count                   = var.node_max_count
    min_count                   = var.node_min_count
    node_count                  = var.node_count
    os_disk_size_gb             = var.os_disk_size_gb
    os_disk_type                = var.os_disk_type
    os_sku                      = var.os_sku
    temporary_name_for_rotation = "tmp"
    vm_size                     = var.vm_size
    vnet_subnet_id              = var.subnet_id
    zones                       = var.zones

    upgrade_settings {
      max_surge = "10%"
    }

    tags = merge(var.tags, local.tags)
  }

  dynamic "api_server_access_profile" {
    for_each = length(var.authorized_ip_ranges) > 0 ? [{}] : []

    content {
      authorized_ip_ranges = api_server_access_profile.value.authorized_ip_ranges
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = "standard"
    outbound_type     = var.outbound_type
    network_policy    = var.network_policy
  }

  microsoft_defender {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_kubernetes_cluster.main.id
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

resource "azurerm_role_assignment" "identity_virtual_network_reader" {
  scope                = data.azurerm_virtual_network.main.id
  role_definition_name = "Reader"
  principal_id         = azurerm_kubernetes_cluster.main.identity[0].principal_id
}

resource "azurerm_role_assignment" "identity_virtual_network_network_contributor" {
  scope                = data.azurerm_virtual_network.main.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.main.identity[0].principal_id
}
