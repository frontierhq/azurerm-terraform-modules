# Key Vault

This module creates a [Key Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "key_vault" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/key-vault/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "secrets"
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  tenant_id                  = data.azurerm_client_config.main.tenant_id
  zone                       = "shd"

  tags = {
    WorkloadType = "Shared/bootstrap"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
