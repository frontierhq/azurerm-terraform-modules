# User Assigned Identity

This module creates a [User Assigned Identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity).

## Usage

```hcl
module "resource_group" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/resource-group/[VERSION]/module.tar.gz//src"

  environment = "dev"
  identifier  = "akscluster"
  location    = "uksouth"
  zone        = "shd"

  tags = {
    WorkloadType = "Shared/bootstrap"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
