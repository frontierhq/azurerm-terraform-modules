provider "azurerm" {
  features {}
}

module "mssql-server" {
  source = "../src"

  environment = "baz"
  identifier  = "qux"
  location    = "uksouth"
  zone        = "waldo"

  log_analytics_workspace_id = "quux"
  sql_server_id              = "123"

  tags = {
    Foo = "Bar"
  }
}
