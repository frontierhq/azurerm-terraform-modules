provider "azurerm" {
  features {}
}

module "virtual_network" {
  source = "../src"

  address_space              = "10.0.0.0/24"
  environment                = "baz"
  identifier                 = "qux"
  location                   = "uksouth"
  log_analytics_workspace_id = "quux"
  resource_group_name        = "grault"
  zone                       = "waldo"

  tags = {
    Foo = "Bar"
  }
}
