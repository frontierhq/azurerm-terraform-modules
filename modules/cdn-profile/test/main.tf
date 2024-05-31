provider "azurerm" {
  features {}
}

module "cdn_profile" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  resource_group_name = "qux"
  zone                = "baz"

  tags = {
    Foo = "Bar"
  }
}
