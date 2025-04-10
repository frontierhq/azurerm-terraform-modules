# Automation Account

This module creates an [Automation Account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "automation_account" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/automation-account/[VERSION]/module.tar.gz//src"

  environment                = "con"
  identifier                 = "main"
  location                   = "uksouth"
  resource_group_name        = module.resource_group.name
  zone                       = "pla"

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
