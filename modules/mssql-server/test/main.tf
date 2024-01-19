provider "azurerm" {
  features {}
}

module "mssql-server" {
  source = "../src"

  administrator_login        = "sqladmin"
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
