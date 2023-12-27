provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../src"

  environment = "bar"
  identifier  = "baz"
  location    = "uksouth"
  zone        = "bat"

  tags = {
    Foo = "Bar"
  }
}
