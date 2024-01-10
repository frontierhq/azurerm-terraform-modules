provider "azurerm" {
  features {}
}

module "virtual_hub" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "baz"
  zone                = "qux"

  address_prefix = "quux"
  virtual_wan_id = "corge"

  tags = {
    Foo = "Bar"
  }
}
