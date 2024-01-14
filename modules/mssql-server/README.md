# MS SQL Server

This module creates a [MS SQL Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "mssql_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/mssql-server/[VERSION]/module.tar.gz//src"

  administrator_username     = "mysqladmin"
  administrator_password     = "P@ssw0rd1234!"
  environment                = "dev"
  identifier                 = "mortgages"
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  zone                       = "mtg"

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
