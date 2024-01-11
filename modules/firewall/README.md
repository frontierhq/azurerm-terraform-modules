# Firewall

This module creates a [Firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall).

## Usage

```hcl
module "firewall" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/firewall/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  log_analytics_workspace_id = var.log_analytics_workspace_id

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
