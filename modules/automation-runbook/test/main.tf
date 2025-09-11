provider "azurerm" {
  features {}
}

module "automation_runbook" {
  source = "../src"

  environment         = "baz"
  identifier          = "qux"
  location            = "uksouth"
  resource_group_name = "grault"
  zone                = "waldo"

  automation_account_name = "foo"
  content                 = "bar"
  runbook_type            = "baz"

  tags = {
    Foo = "Bar"
  }
}
