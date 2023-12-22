provider "azurerm" {
  features {}
}

module "key_vault" {
  source = "../src"

  environment                = "bar"
  identifier                 = "baz"
  location                   = "uksouth"
  log_analytics_workspace_id = "quz"
  resource_group_name        = "bar"
  tenant_id                  = "baz"
  workload_name              = "foo"
  workload_type              = "foo/bar"
  workload_version           = "1.0.0"
  zone                       = "bat"

  tags = {
    Foo = "Bar"
  }
}
