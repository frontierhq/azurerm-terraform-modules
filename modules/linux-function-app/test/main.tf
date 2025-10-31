provider "azurerm" {
  features {}
}

module "linux_function_app" {
  source = "../src"

  environment         = "foo"
  identifier          = "bar"
  location            = "uks"
  resource_group_name = "res-foo"
  zone                = "tst"

  log_analytics_workspace_id = "flog"
  instrumentation_key        = "key-bar"
  service_plan_id            = "app-id"
  storage_account_name       = "stor-bar"
  storage_account_access_key = "007"
  tags = {
    bar = "foo"
  }
}
