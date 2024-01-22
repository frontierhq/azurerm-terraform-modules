# Cosmosdb Account

This module creates a [Cosmosdb Account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account).

## Usage

```hcl
module "cosmosdb_account" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/cosmosdb-account/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
