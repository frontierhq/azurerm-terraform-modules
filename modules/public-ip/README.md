# Public IP

This module creates a [Public IP](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "public_ip" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/public-ip/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "main"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  tags = {
    WorkloadType = "Shared/public-ip"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
