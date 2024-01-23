provider "azurerm" {
  features {}
}

module "cognitive-services" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "foobar"
  zone                = "bat"

  log_analytics_workspace_id = "foo"

  tags = {
    Foo = "Bar"
  }
}