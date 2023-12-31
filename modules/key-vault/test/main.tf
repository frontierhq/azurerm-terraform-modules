provider "azurerm" {
  features {}
}

module "key_vault" {
  source = "../src"

  environment                = "foo"
  identifier                 = "bar"
  location                   = "uksouth"
  log_analytics_workspace_id = "baz"
  resource_group_name        = "qux"
  tenant_id                  = "quux"
  zone                       = "corge"

  tags = {
    Foo = "Bar"
  }
}
