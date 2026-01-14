resource "azurerm_data_protection_backup_policy_postgresql_flexible_server" "main" {
  name                            = replace("pol-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}", "_", "-")
  vault_id                        = var.backup_vault_id
  backup_repeating_time_intervals = ["R/${formatdate("YYYY-MM-DD", timestamp())}T${var.vault_policy.time}+00:00/P1W"]
  time_zone                       = var.vault_policy.timezone

  default_retention_rule {
    life_cycle {
      duration        = "P7D"
      data_store_type = "VaultStore"
    }
  }

  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_daily_count > 0 ? [1] : []
    content {
      name = "Daily"
      life_cycle {
        duration        = "P${var.vault_policy.retention_daily_count}D"
        data_store_type = "VaultStore"
      }
      priority = 25

      criteria {
        days_of_week = length(var.vault_policy.weekdays) > 0 ? var.vault_policy.weekdays : null
      }
    }
  }

  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_weekly_count > 0 ? [1] : []
    content {
      name = "Weekly"
      life_cycle {
        duration        = "P${var.vault_policy.retention_weekly_count}W"
        data_store_type = "VaultStore"
      }
      priority = 20

      criteria {
        days_of_week = length(var.vault_policy.weekdays) > 0 ? var.vault_policy.weekdays : null
      }
    }
  }

  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_monthly_count > 0 ? [1] : []
    content {
      name = "Monthly"
      life_cycle {
        duration        = "P${var.vault_policy.retention_monthly_count}M"
        data_store_type = "VaultStore"
      }
      priority = 15

      criteria {
        days_of_week   = length(var.vault_policy.weekdays) > 0 ? var.vault_policy.weekdays : null
        weeks_of_month = length(var.vault_policy.weeks) > 0 ? var.vault_policy.weeks : null
      }
    }
  }

  # Yearly retention (must use absolute_criteria)
  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_yearly_count > 0 ? [1] : []
    content {
      name = "Yearly"
      life_cycle {
        duration        = "P${var.vault_policy.retention_yearly_count}Y"
        data_store_type = "VaultStore"
      }
      priority = 10

      criteria {
        absolute_criteria = "FirstOfYear"
      }
    }
  }

  lifecycle {
    ignore_changes = [backup_repeating_time_intervals]
  }
}
