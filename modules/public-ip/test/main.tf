provider "azurerm" {
  features {}
}

module "public_ip" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  allocation_method          = "foo"
  log_analytics_workspace_id = "bar"

  tags = {
    Foo = "Bar"
  }
}
