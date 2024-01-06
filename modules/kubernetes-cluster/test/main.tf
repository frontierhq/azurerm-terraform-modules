provider "azurerm" {
  features {}
}

module "kubernetes_cluster" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uksouth"
  resource_group_name = "qux"
  zone                = "corge"

  kubernetes_version         = "1.2.3"
  log_analytics_workspace_id = "baz"
  subnet_id                  = "quux"

  tags = {
    Foo = "Bar"
  }
}
