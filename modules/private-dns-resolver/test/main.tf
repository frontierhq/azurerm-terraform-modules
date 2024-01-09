provider "azurerm" {
  features {}
}

module "private_dns_resolver" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "baz"
  zone                = "qux"

  virtual_network_id = "quux"

  tags = {
    Foo = "Bar"
  }
}
