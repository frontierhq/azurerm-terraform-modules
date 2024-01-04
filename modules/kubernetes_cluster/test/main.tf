provider "azurerm" {
  features {}
}

module "kubernetes_cluster" {
  source = "../src"

  environment                = "foo"
  identifier                 = "bar"
  kubernetes_version         = "1.2.3"
  location                   = "uksouth"
  log_analytics_workspace_id = "baz"
  resource_group_name        = "qux"
  subnet_id                  = "quux"
  zone                       = "corge"

  tags = {
    Foo = "Bar"
  }
}
