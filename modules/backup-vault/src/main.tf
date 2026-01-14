resource "azurerm_data_protection_backup_vault" "main" {
  name                = "bkv-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = var.datastore_type
  immutability        = var.immutability
  soft_delete         = var.soft_delete

  cross_region_restore_enabled = var.cross_region_restore_enabled
  redundancy                   = var.redundancy
  identity {
    type = "SystemAssigned"
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "default" {
  name                           = "backup"
  target_resource_id             = azurerm_data_protection_backup_vault.main.id
  log_analytics_workspace_id     = var.service_workspace_id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category = "CoreAzureBackup"
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
  }

  enabled_log {
    category = "AddonAzureBackupPolicy"
  }

  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
