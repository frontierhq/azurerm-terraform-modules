# VPN Server Configuration

This module creates a [VPN Server Configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_server_configuration)

## Usage

```hcl
module "vpn_server_configuration" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/vpn-server-configuration/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "aad"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  vpn_authentication_types = ["AAD"]
  vpn_protocols            = ["OpenVPN"]

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
