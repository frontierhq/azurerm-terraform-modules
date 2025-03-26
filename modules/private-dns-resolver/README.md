# Private DNS Resolver

This module creates a [Private DNS Resolver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver), including [Inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_inbound_endpoint) and [Outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_outbound_endpoint) Endpoints.

## Usage

```hcl
module "private_dns_resolver" {
  source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/private-dns-resolver/[VERSION]/module.tar.gz//src"

  environment                = "con"
  identifier                 = "main"
  location                   = "uksouth"
  resource_group_name        = module.resource_group.name
  zone                       = "pla"

  virtual_network_id  = module.virtual_network.id

  tags = {
    WorkloadType = "PlatformLZ/private-dns-resolver"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
