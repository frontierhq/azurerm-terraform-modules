provider "azurerm" {
  features {}
}

module "automation_account" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  log_analytics_workspace_id = "quux"

  tags = {
    Foo = "Bar"
  }
}
