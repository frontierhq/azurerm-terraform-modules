provider "azurerm" {
  features {}
}

module "cdn_profile" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "baz"

  tags = {
    Foo = "Bar"
  }
}
