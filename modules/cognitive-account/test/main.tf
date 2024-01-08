provider "azurerm" {
  features {}
}

module "cognitive-search" {
  source = "../src"

  environment         = "bar"
  identifier          = "baz"
  location            = "uksouth"
  resource_group_name = "floof"
  workload_name       = "foo"
  workload_type       = "foo/bar"
  workload_version    = "1.0.0"
  zone                = "bat"

  tags = {
    Foo = "Bar"
  }
}
