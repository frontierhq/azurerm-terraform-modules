# Virtual Hub

This module creates a [Virtual Hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub).

## Usage

```hcl
module "virtual_hub" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/virtual-hub/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  address_prefix = "10.1.0.0/24"
  virtual_wan_id = module.virtual_wan.id

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
