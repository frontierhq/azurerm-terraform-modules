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
  workload_name       = "foo"
  workload_type       = "foo/bar"
  workload_version    = "1.0.0"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
