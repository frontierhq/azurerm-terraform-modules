provider "azurerm" {
  features {}
}

module "azurerm_mssql_server" {
  source = "../src"

  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd"
  resource_group_name          = "bar"
  environment                  = "bar"
  identifier                   = "baz"
  location                     = "uksouth"
  workload_name                = "foo"
  workload_type                = "foo/bar"
  workload_version             = "1.0.0"
  zone                         = "bat"

  tags = {
    Foo = "Bar"
  }
}
