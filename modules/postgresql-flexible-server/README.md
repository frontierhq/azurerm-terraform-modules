# PostgreSQL Flexible Server

This module creates a [PostgreSQL Flexible Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "postgresql_flexible_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/postgresql-flexible-server/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "buildagents"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "shd"

  administrator_login        = "postgres"
  administrator_password     = random_password.postgres_admin.result
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "SharedServicesLZ/build-agents"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
