# Virtual Network Gateway

This module creates a [Virtual Network Gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "virtual_network_gateway" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-network-gateway/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  public_ip_address_id       = module.public_ip.id
  subnet_id                  = azurerm_subnet.vngw.id

  tags = {
    WorkloadType = "Shared/virtual-network-gateway"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
