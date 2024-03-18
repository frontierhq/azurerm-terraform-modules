provider "azurerm" {
  features {}
}

module "eventhub_namespace" {
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
