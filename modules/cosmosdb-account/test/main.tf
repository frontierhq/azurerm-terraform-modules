provider "azurerm" {
  features {}
}

module "comosdb_account" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "bar"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
