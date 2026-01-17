provider "azurerm" {
  features {}
}

module "app_service_plan" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  os_type             = "boo"
  resource_group_name = "bar"
  sku_name            = "far"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
