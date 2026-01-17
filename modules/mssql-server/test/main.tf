provider "azurerm" {
  features {}
}

module "mssql-server" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  log_analytics_workspace_id = "quux"
  azuread_administrator = {
    azuread_authentication_only = true
    login_username              = "corge"
    object_id                   = "grault"
  }

  tags = {
    Foo = "Bar"
  }
}
