provider "azurerm" {
  features {}
}

module "recovery_services_vault" {
  source = "../src"

  environment         = "rnd"
  identifier          = "recovery"
  location            = "westeurope"
  resource_group_name = "rg-test-name"
  zone                = "baz"

  cross_region_restore_enabled = false
  immutability                 = "Unlocked"
  storage_mode_type            = "LocallyRedundant"
  soft_delete_enabled          = false

  identity_ids = ["RBAC_identity_id"]

  tags = {
    Key = "Value"
  }
}
