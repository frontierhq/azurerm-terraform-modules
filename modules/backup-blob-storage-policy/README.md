# Backup-blob-storage-policy

## Overview
This Terraform module provisions a **Backup Policy** for an [Backup Vault](https://learn.microsoft.com/en-us/azure/backup/backup-overview). The policy defines how long to retain those backups, and other critical settings for data protection compliance.

Use this module in combination with a Backup Vault to fully automate backup configuration. [Terraform resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_policy_blob_storage)


## Usage
Naming convention defaults to `pol-....`
```hcl
module "backup_policy_blob_storage" {
    source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/backup-blob-storage-policy/[VERSION]/module.tar.gz//src"

    environment = "rnd"
    identifier  = "identifier"
    location    = "westeurope"
    zone        = "shd"

    resource_group_name = module.resource_group.name
    backup_vault_id     = module.vault.id

  vault_policy = {
      policy_level = "gold"
      frequency    = "Daily" # Or "Weekly"
      time         = "00:00"
      timezone     = "UTC"
      policy_type  = "V2"

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
