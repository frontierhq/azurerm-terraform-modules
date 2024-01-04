provider "azurerm" {
  features {}
}

module "user_assigned_identity" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "quux"

  tags = {
    Foo = "Bar"
  }
}
