provider "azurerm" {
  features {}
}

module "function_app_element" {
  source = "../src"

  environment                = "foo"
  identifier                 = "bar"
  zone                       = "tst"
  location                   = "uks"
  log_analytics_workspace_id = "flog"
  instrumentation_key        = "key-bar"
  resource_group_name        = "res-foo"
  service_plan_id            = "app-id"
  storage_account_name       = "stor-bar"
  storage_account_access_key = "007"
  tags = {
    bar = "foo"
  }
}
