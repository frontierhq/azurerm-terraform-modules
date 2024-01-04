# Resource Group

This module creates a [Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group).

## Usage

```hcl
module "resource_group" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/resource-group/[VERSION]/module.tar.gz//src"

  environment = "dev"
  identifier  = "k8s"
  location    = "uksouth"
  zone        = "shd"

  tags = {
    WorkloadType = "CustomerBankingLZ/container-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
