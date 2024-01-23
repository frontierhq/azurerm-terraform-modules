provider "azurerm" {
  features {}
}

module "log_analytics_workspace" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "bat"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
