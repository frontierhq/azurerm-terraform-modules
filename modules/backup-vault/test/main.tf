provider "azurerm" {
  features {}
}

module "backup_vault" {
  source = "../src"

  environment         = "rnd"
  identifier          = "backupvault"
  location            = "westeurope"
  resource_group_name = "rg-test-name"
  zone                = "t1"

  cross_region_restore_enabled = false
  datastore_type               = "VaultStore"
  immutability                 = "Unlocked"
  redundancy                   = "LocallyRedundant"
  soft_delete                  = "On"


  tags = {
    Key = "Value"
  }
}
