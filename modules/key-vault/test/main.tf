provider "azurerm" {
  features {}
}

module "key_vault" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "corge"

  log_analytics_workspace_id = "baz"
  tenant_id                  = "quux"

  tags = {
    Foo = "Bar"
  }
}
