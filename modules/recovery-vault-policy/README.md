# recovery-vault-policy

## Overview
This Terraform module provisions a **Backup Policy** for an [Azure Recovery Services Vault (RSV)](https://learn.microsoft.com/en-us/azure/backup/backup-overview). The policy defines how and when Azure Virtual Machines (VMs) are backed up, how long to retain those backups, and other critical settings for data protection compliance.

Use this module in combination with a Recovery Services Vault and VM protection module to fully automate backup configuration.


## Usage
Naming convention defaults to `pol-....`
```hcl
module "recovery_vault_policy" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/rescovery-vault-policy/[VERSION]/module.tar.gz//src"

  environment         = "env"
  identifier          = "identifier"
  location            = "westeurope"
  zone                = "boo"

  resource_group_name = module.resource_group.name
  recovery_vault_name = module.rsv.name

  tags = {
    WorkloadType = "CustomerBankingLZ/container-platform"
  }

  vault_policy = {
      policy_level = "gold"
      frequency    = "Daily" # Or "Weekly"
      time         = "00:00"
      timezone     = "UTC"
      policy_type  = "V2"

      instant_restore_retention_days = 2

      retention_daily_count   = 2
      retention_weekly_count  = 2
      retention_monthly_count = 5
      retention_yearly_count  = 5

      months   = "January"
      weeks    = "First"
      weekdays = "Sunday"
    }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
