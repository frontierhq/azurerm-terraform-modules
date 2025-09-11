# Container Registry

This module creates a [Container Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "container_registry" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/container-registry/[VERSION]/module.tar.gz//src"

  environment         = "prd"
  identifier          = "apps"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "shd"

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "Shared/apps-registry"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
