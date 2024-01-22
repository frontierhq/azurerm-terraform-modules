provider "azurerm" {
  features {}
}

module "app_service" {
  source = "../src"

  account_name        = "foo"
  database_name       = "datafoo"
  name                = "foobar"
  partition_key_path  = "barpath"
  resource_group_name = "bar"

  tags = {
    Foo = "Bar"
  }
}
