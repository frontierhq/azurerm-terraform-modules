provider "azurerm" {
  features {}
}

module "recovery_vault_policy" {
  source = "../src"

  environment = "rnd"
  identifier  = "identifier"
  location    = "uksouth"
  zone        = "baz"

  recovery_vault_name = "rsv-test-name"
  resource_group_name = "rg-test-name"

  vault_policy = {
    policy_level = "gold"
    frequency    = "Daily" # Or "Weekly"
    time         = "00:00"
    timezone     = "UTC"

    retention_daily_count   = 2
    retention_weekly_count  = 2
    retention_monthly_count = 5
    retention_yearly_count  = 5

    months   = "January"
    weeks    = "First"
    weekdays = "Sunday"
  }

}

