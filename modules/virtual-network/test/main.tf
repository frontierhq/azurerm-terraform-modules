provider "azurerm" {
  features {}
}

module "virtual_network" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  address_space              = "10.0.0.0/24"
  log_analytics_workspace_id = "quux"

  tags = {
    Foo = "Bar"
  }
}
