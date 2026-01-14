resource "azurerm_backup_policy_vm" "main" {
  name                = "pol-${var.vault_policy.policy_level}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  timezone            = var.vault_policy.timezone
  policy_type         = var.policy_type

  backup {
    frequency = var.vault_policy.frequency
    time      = var.vault_policy.time
  }

  retention_daily {
    count = var.vault_policy.retention_daily_count
  }

  dynamic "retention_weekly" {
    for_each = var.vault_policy.retention_weekly_count > 0 ? [1] : []
    content {
      count    = var.vault_policy.retention_weekly_count
      weekdays = [var.vault_policy.weekdays]
    }
  }

  dynamic "retention_monthly" {
    for_each = var.vault_policy.retention_monthly_count > 0 ? [1] : []
    content {
      count    = var.vault_policy.retention_monthly_count
      weekdays = [var.vault_policy.weekdays]
      weeks    = [var.vault_policy.weeks]
    }
  }

  dynamic "retention_yearly" {
    for_each = var.vault_policy.retention_yearly_count > 0 ? [1] : []
    content {
      count    = var.vault_policy.retention_yearly_count
      weekdays = [var.vault_policy.weekdays]
      weeks    = [var.vault_policy.weeks]
      months   = [var.vault_policy.months]
    }
  }

  instant_restore_retention_days = try(var.vault_policy.instant_restore_retention_days, null)

}
