# Log Analytics Workspace

This module creates a [Log Analytics Workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace).

## Usage

```hcl
module "log_analytics_workspace" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/log-analytics-workspace/[VERSION]/module.tar.gz//src"

  environment         = "mgt"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  tags = {
    WorkloadType = "PlatformLZ/bootstrap"
  }
}

```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
