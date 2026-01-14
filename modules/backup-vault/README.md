# backup-vault

This Terraform module provisions an [Backup Vault](https://learn.microsoft.com/en-us/azure/backup/manage-backup-vault), which provides a secure and scalable solution for backing up and restoring Azure workloads like virtual machines, SQL databases, and file shares.

## Usage

Naming convention defaults to `bkv-....`
```hcl
module "bkp_vault" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/backup-vault/[VERSION]/module.tar.gz//src"
  environment         = "rnd"
  identifier          = "backupvault"
  location            = "West UK"
  zone                = "shd"

  cross_region_restore_enabled = false
  datastore_type               = "VaultStore"
  immutability                 = "Unlocked"
  redundancy                   = "LocallyRedundant"
  soft_delete                  = "On"

  tags = {
    WorkloadType = "CustomerBankingLZ/container-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
