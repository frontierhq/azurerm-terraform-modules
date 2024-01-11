provider "azurerm" {
  features {}
}

module "firewall" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "corge"

  log_analytics_workspace_id = "grault"

  tags = {
    Foo = "Bar"
  }
}
