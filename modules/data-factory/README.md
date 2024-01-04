# Data Factory

This module creates a [Data Factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "data_factory" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/data-factory/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  tags = {
    WorkloadType = "Mortgage/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
