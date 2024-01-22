provider "azurerm" {
  features {}
}

module "cognitive-search" {
  source = "../src"

  environment                = "bar"
  identifier                 = "baz"
  location                   = "uksouth"
  log_analytics_workspace_id = "foo"
  resource_group_name        = "foobar"
  zone                       = "bat"

  tags = {
    Foo = "Bar"
  }
}
