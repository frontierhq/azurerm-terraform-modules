provider "azurerm" {
  features {}
}

module "postgresql_flexible_server" {
  source = "../src"

  administrator_login        = "foo"
  administrator_password     = "bar"
  environment                = "baz"
  identifier                 = "qux"
  location                   = "uksouth"
  log_analytics_workspace_id = "quux"
  private_dns_zone_id        = "corge"
  resource_group_name        = "grault"
  subnet_id                  = "grault"
  zone                       = "waldo"

  tags = {
    Foo = "Bar"
  }
}
