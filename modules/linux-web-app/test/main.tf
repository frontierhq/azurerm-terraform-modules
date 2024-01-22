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

  log_analytics_workspace_id = "foolog"
  service_plan_id            = "barfoo"

  tags = {
    Foo = "Bar"
  }
}
