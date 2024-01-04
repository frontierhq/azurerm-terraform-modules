# Firewall Policy

## Usage

```hcl
module "firewall_policy" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/firewall-policy/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "customerbanking"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  tags = {
    WorkloadType = "PlatformLZ/firewall-policy"
  }
}

```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
