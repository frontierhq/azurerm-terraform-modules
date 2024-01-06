# Private Endpoint

This module creates a [Private Endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint).

## Usage

```hcl
module "private_endpoint" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/private-endpoint/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  private_connection_resource_id = module.sql_server.id
  private_dns_zone_id            = module.private_dns_zone.id
  subnet_id                      = module.subnet.id

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
