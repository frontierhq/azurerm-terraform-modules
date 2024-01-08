provider "azurerm" {
  features {}
}

module "virtual_wan" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "baz"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
