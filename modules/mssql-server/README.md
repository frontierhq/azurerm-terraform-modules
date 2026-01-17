# Microsoft SQL Azure Database Server

This module creates a [Microsoft SQL Azure Database Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "mssql_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/mssql_server/[VERSION]/module.tar.gz//src"

  administrator_login          = "mssqladmin"
  administrator_login_password = "P@ssw0rd1234!"
  minimum_tls_version          = "TLS1_2"
  location                     = "uksouth"
  name                         = "mssql-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name          = module.resource_group_name
  version                      = var.sql_server_version

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
