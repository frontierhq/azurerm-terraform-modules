resource "azurerm_data_protection_backup_policy_blob_storage" "main" {
  name                                   = replace("pol-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}", "_", "-")
  vault_id                               = var.backup_vault_id
  operational_default_retention_duration = "P30D"
  vault_default_retention_duration       = "P7D"
  backup_repeating_time_intervals        = ["R/${formatdate("YYYY-MM-DD", timestamp())}T${var.vault_policy.time}+00:00/P1W"]

  # Daily
  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_daily_count > 0 ? [1] : []
    content {
      name     = "Daily"
      priority = 15

      life_cycle {
        duration        = "P${var.vault_policy.retention_daily_count}D"
        data_store_type = "VaultStore"
      }

      criteria {
        days_of_week = [var.vault_policy.weekdays]
      }
    }
  }

  # Weekly
  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_weekly_count > 0 ? [1] : []
    content {
      name     = "Weekly"
      priority = 20

      life_cycle {
        duration        = "P${var.vault_policy.retention_weekly_count}W"
        data_store_type = "VaultStore"
      }

      criteria {
        days_of_week = [var.vault_policy.weekdays]
      }
    }
  }

  # Monthly
  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_monthly_count > 0 ? [1] : []
    content {
      name     = "Monthly"
      priority = 10

      life_cycle {
        duration        = "P${var.vault_policy.retention_monthly_count}M"
        data_store_type = "VaultStore"
      }

      criteria {
        days_of_month = [var.vault_policy.days]
      }
    }
  }

  # Yearly
  dynamic "retention_rule" {
    for_each = var.vault_policy.retention_yearly_count > 0 ? [1] : []
    content {
      name     = "Yearly"
      priority = 5

      life_cycle {
        duration        = "P${var.vault_policy.retention_yearly_count}Y"
        data_store_type = "VaultStore"
      }

      criteria {
        months_of_year = [var.vault_policy.months]
        days_of_month  = [var.vault_policy.days]
      }
    }
  }

  lifecycle {
    ignore_changes = [backup_repeating_time_intervals]
  }
}
