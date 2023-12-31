provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../src"

  environment = "foo"
  identifier  = "bar"
  location    = "uksouth"
  zone        = "baz"

  tags = {
    Foo = "Bar"
  }
}
