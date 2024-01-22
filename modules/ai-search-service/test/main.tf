provider "azurerm" {
  features {}
}

module "app_service" {
  source = "../src"

  environment                = "bar"
  identifier                 = "baz"
  location                   = "uksouth"
  log_analytics_workspace_id = "foo"
  resource_group_name        = "bar"
  zone                       = "bat"

  tags = {
    Foo = "Bar"
  }
}
