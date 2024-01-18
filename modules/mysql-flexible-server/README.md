# MySQL Flexible Server

This module creates a [MySQL Flexible Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "mysql_flexible_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/mysql-flexible-server/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  administrator_login        = "mysqladmin"
  administrator_password     = "P@ssw0rd1234!"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

- [Cannot control public access with azurerm provider](https://github.com/hashicorp/terraform-provider-azurerm/issues/21832).

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
