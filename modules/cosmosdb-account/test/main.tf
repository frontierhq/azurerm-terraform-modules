provider "azurerm" {
  features {}
}

module "app_service" {
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
