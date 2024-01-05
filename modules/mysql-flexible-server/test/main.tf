provider "azurerm" {
  features {}
}

module "mysql_flexible_server" {
  source = "../src"

  administrator_login        = "mysqladmin"
  administrator_password     = "P@ssw0rd1234!"
  environment                = "baz"
  identifier                 = "qux"
  location                   = "uksouth"
  log_analytics_workspace_id = "quux"
  resource_group_name        = "grault"
  zone                       = "waldo"

  tags = {
    Foo = "Bar"
  }
}
