provider "azurerm" {
  features {}
}

module "storage_account" {
  source = "../src"

  environment                = "foo"
  identifier                 = "bar"
  location                   = "uksouth"
  log_analytics_workspace_id = "baz"
  resource_group_name        = "qux"
  zone                       = "quux"

  tags = {
    Foo = "Bar"
  }
}
