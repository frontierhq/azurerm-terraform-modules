# App Service: Service Plan

This module creates an [App Service: Service Plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan).

## Usage

```hcl
module "service_plan" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/service-plan/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  os_type  = "Linux"
  sku_name = "P0v3"


  tags = {
    WorkloadType = "MortgagesLZ/web-services"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
