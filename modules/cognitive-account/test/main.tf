provider "azurerm" {
  features {}
}

module "cognitive-search" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "floof"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
