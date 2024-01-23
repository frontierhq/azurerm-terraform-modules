provider "azurerm" {
  features {}
}

module "service_plan" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "bar"
  zone                = "bat"

  os_type  = "boo"
  sku_name = "far"

  tags = {
    Foo = "Bar"
  }
}
