# MS SQL Server

This module creates a [MS SQL Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "mssql_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/mssql-server/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  azuread_administrator = {
    azuread_authentication_only = true
    login_username = "admin"
    object_id      = "12345678"
  }
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
