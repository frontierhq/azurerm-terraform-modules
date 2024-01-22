# Data Factory

This module creates a [Linux Function App](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "linux_function_app" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/linux-function-app/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "mortgages"
  instrumentation_key        = azurerm_application_insights.main.instrumentation_key
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  service_plan_id            = module.app_service_plan.id
  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.primary_access_key
  zone                       = "mtg"

  tags = {
    WorkloadType = "MortgagesLZ/integration"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
