provider "azurerm" {
  features {}
}

module "postgresql_flexible_server" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  administrator_login        = "foo"
  administrator_password     = "bar"
  log_analytics_workspace_id = "quux"

  tags = {
    Foo = "Bar"
  }
}
