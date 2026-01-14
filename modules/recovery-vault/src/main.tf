resource "azurerm_recovery_services_vault" "main" {
  # Recovery Service Vault name must be 2 - 50 characters long,
  # start with a letter, contain only letters, numbers and hyphens.
  name                = "rsv-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku                 = var.sku
  immutability        = var.immutability
  storage_mode_type   = var.storage_mode_type
  soft_delete_enabled = var.soft_delete_enabled

  cross_region_restore_enabled  = var.cross_region_restore_enabled
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = var.identity_ids
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "default" {
  name                           = "backup"
  target_resource_id             = azurerm_recovery_services_vault.main.id
  log_analytics_workspace_id     = var.service_workspace_id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category = "CoreAzureBackup"
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
  }

  enabled_log {
    category = "AddonAzureBackupAlerts"
  }

  enabled_log {
    category = "AddonAzureBackupAlerts"
  }

  enabled_log {
    category = "AddonAzureBackupPolicy"
  }

  enabled_log {
    category = "AddonAzureBackupStorage"
  }

  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "asr" {
  name                           = "asr"
  target_resource_id             = azurerm_recovery_services_vault.main.id
  log_analytics_workspace_id     = var.service_workspace_id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category = "AzureSiteRecoveryJobs"
  }

  enabled_log {
    category = "AzureSiteRecoveryEvents"
  }

  enabled_log {
    category = "AzureSiteRecoveryReplicatedItems"
  }

  enabled_log {
    category = "AzureSiteRecoveryReplicationStats"
  }

  enabled_log {
    category = "AzureSiteRecoveryRecoveryPoints"
  }

  enabled_log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
  }

  enabled_log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
  }

  enabled_log {
    category = "ASRReplicatedItems"
  }
}

resource "azurerm_monitor_diagnostic_setting" "security" {
  name                           = "security"
  target_resource_id             = azurerm_recovery_services_vault.main.id
  log_analytics_workspace_id     = var.sentinel_workspace_id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category = "AzureBackupOperations"
  }

  lifecycle {
    ignore_changes = [metric]
  }
}
