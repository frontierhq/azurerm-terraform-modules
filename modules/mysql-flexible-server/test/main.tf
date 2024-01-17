provider "azapi" {
}

provider "azurerm" {
  features {}
}

module "mysql_flexible_server" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  administrator_login        = "mysqladmin"
  administrator_password     = "P@ssw0rd1234!"
  log_analytics_workspace_id = "quux"

  tags = {
    Foo = "Bar"
  }
}
