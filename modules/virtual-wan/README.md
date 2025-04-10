# Virtual WAN

This module creates a [Virtual WAN](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan).

## Usage

```hcl
module "virtual_wan" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-wan/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
