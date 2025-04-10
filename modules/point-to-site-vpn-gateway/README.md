# Point-to-Site VPN Gateway

This module creates a [Point-to-Site VPN Gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/point_to_site_vpn_gateway).

## Usage

```hcl
module "point_to_site_vpn_gateway" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/point-to-site-vpn-gateway/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "staff"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  virtual_hub_id                           = module.virtual_hub.id
  vpn_client_address_pool_address_prefixes = ["10.1.254.0/24"]
  vpn_server_configuration_id              = azurerm_vpn_server_configuration.main.id

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
