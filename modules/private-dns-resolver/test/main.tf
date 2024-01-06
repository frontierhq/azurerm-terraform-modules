provider "azurerm" {
  features {}
}

module "private_dns_resolver" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "foo"
  virtual_network_id  = "bar"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
