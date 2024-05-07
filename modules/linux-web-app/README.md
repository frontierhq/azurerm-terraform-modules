# Linux Web App

This module creates a [Linux Web App](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "linux_web_app" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/linux-web-app/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  service_plan_id            = module.service_plan.id
  instrumentation_key        = azurerm_application_insights.main.instrumentation_key

  tags = {
    WorkloadType = "MortgagesLZ/web-services"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
