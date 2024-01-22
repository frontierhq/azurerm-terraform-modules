provider "azurerm" {
  features {}
}

module "app_service" {
  source = "../src"

  environment                = "bar"
  identifier                 = "baz"
  location                   = "uksouth"
  log_analytics_workspace_id = "foolog"
  resource_group_name        = "bar"
  service_plan_id            = "barfoo"
  zone                       = "bat"

  tags = {
    Foo = "Bar"
  }
}
