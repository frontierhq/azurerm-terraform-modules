# CDN Profile

This module creates a [CDN Profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_profile).

## Usage

```hcl
module "cdn_profile" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/cdn-profile/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "k8s"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "shd"

  tags = {
    WorkloadType = "CustomerBankingLZ/container-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
