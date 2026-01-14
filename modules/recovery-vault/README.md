# Recovery Services Vault Terraform Module

This module provisions an Azure [Recovery Services Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault).

## Usage

```hcl
module "recovery_services_vault" {
    source = "https://github.com/frontierhq/azurerm-terraform-modules/releases/download/recovery-services-vault/[VERSION]/module.tar.gz//src"

  environment         = "prod"
  short_location      = "uks"
  identifier          = "01"
  zone                = "shd"


  location            = "uksouth"
  resource_group_name = "rg-platform-prod-uks"

  tags = {
    WorkloadType = "CustomerBankingLZ/container-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/frontierhq/azurerm-terraform-modules/blob/main/README.rst#contributing>.
