# User Assigned Identity

This module creates a [User Assigned Identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity).

## Usage

```hcl
module "azurerm_user_assigned_identity" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/user-assigned-identity/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "akscluster"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "shd"

  tags = {
    Foo = "Bar"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
