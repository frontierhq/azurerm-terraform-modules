provider "azurerm" {
  features {}
}

module "storage_account" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "quux"

  log_analytics_workspace_id = "baz"

  tags = {
    Foo = "Bar"
  }
}
