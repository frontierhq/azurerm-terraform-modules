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
  zone                         = "bat"

  tags = {
    Foo = "Bar"
  }
}
