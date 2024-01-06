resource "azurerm_kubernetes_cluster" "main" {
  name                = "k8s-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix          = "${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "rg-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}k8snodes"

  azure_policy_enabled = true

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = var.admin_group_object_ids
    azure_rbac_enabled     = true
  }

  default_node_pool {
    name = "system"

    enable_auto_scaling         = var.enable_auto_scaling
    max_count                   = var.node_max_count
    min_count                   = var.node_min_count
    node_count                  = var.node_count
    temporary_name_for_rotation = "tmp"
    vm_size                     = var.vm_size
    vnet_subnet_id              = var.subnet_id
    zones                       = var.zones

    upgrade_settings {
      max_surge = "10%"
    }

    tags = merge(var.tags, local.tags)
  }

  api_server_access_profile {
    authorized_ip_ranges     = var.authorized_ip_ranges
    vnet_integration_enabled = false
  }

  identity {
    type         = "SystemAssigned"
    identity_ids = []
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

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-audit"
  }

  enabled_log {
    category = "kube-audit-admin"
  }

  enabled_log {
    category = "kube-controller-manager"
  }

  enabled_log {
    category = "kube-scheduler"
  }

  enabled_log {
    category = "cluster-autoscaler"
  }

  enabled_log {
    category = "cloud-controller-manager"
  }

  metric {
    category = "AllMetrics"
  }
}
