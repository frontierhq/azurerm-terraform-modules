# EventHub Namespace

This module creates an [EventHub Namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace).

## Usage

```hcl
module "eventhub_namespace" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/eventhub-namespace/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "activitylogs"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "PlatformLZ/eventhub-namespace"
  }
}

```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
