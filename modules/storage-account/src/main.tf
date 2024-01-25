resource "azurerm_storage_account" "main" {
  name                = "sa0${var.zone}0${var.environment}0${lookup(local.short_locations, var.location)}0${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier                     = var.access_tier
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  allowed_copy_scope              = var.allowed_copy_scope
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  enable_https_traffic_only       = var.enable_https_traffic_only
  # if SFTP is enabled then HNS needs to be enabled too
  # https://learn.microsoft.com/en-gb/azure/storage/blobs/secure-file-transfer-protocol-support#sftp-and-the-hierarchical-namespace
  is_hns_enabled                = anytrue([var.is_hns_enabled, var.sftp_enabled])
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = var.public_network_access_enabled
  sftp_enabled                  = var.sftp_enabled

  dynamic "blob_properties" {
    for_each = var.cors_rules != null ? [{}] : []
    content {
      dynamic "cors_rule" {
        for_each = var.cors_rules
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }
    }
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_storage_account_network_rules" "main" {
  storage_account_id         = azurerm_storage_account.main.id
  default_action             = var.allow_all_networks ? "Allow" : "Deny"
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
  ip_rules                   = var.ip_rules
  bypass                     = var.network_rules_bypass

  dynamic "private_link_access" {
    for_each = toset(var.private_link_access)
    content {
      endpoint_resource_id = private_link_access.key
    }
  }

  depends_on = [var.network_rules_depends_on]
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_storage_account.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "Capacity"
  }

  metric {
    category = "Transaction"
  }
}
