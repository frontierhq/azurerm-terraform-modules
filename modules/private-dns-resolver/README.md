# Private DNS Resolver

This module creates a [Private DNS Resolver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "private_dns_resolver" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/private_dns_resolver/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  virtual_network_id  = "bar"

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
