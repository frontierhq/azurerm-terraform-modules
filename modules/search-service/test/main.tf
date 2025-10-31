provider "azurerm" {
  features {}
}

module "search_service" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "bar"
  zone                = "bat"

  log_analytics_workspace_id = "foo"

  tags = {
    Foo = "Bar"
  }
}
