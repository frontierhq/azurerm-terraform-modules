provider "azurerm" {
  features {}
}

module "firewall_policy" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "baz"
  zone                = "qux"

  tags = {
    Foo = "Bar"
  }
}
