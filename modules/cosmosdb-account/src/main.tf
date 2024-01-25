resource "azurerm_cosmosdb_account" "main" {
  name                = "ca-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer
  kind                = var.kind
  tags                = merge(var.tags, local.tags)

  enable_automatic_failover = true

  dynamic "capabilities" {
    for_each = var.capabilities
    content {
      name = capabilities.value
    }
  }

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  dynamic "geo_location" {
    for_each = var.failover_locations != null ? var.failover_locations : local.failover_default_location
    content {
      location          = geo_location.value.location
      failover_priority = lookup(geo_location.value, "priority", 0)
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }

  ip_range_filter = join(",", var.ip_range_filter)

  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule != null ? toset(var.virtual_network_rule) : []
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
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
