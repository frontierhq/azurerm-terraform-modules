# Virtual Network

This module creates a [Virtual Network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "virtual_network" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/virtual-network/[VERSION]/module.tar.gz//src"

  address_space              " "10.0.0.0/24"
  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
