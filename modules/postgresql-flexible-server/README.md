# PostgreSQL Flexible Server

This module creates a [PostgreSQL Flexible Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "postgresql_flexible_server" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/postgresql-flexible-server/[VERSION]/module.tar.gz//src"

  administrator_login        = "postgres"
  administrator_password     = random_password.postgres_admin.result
  environment                = "dev"
  identifier                 = "nexusiq"
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  private_dns_zone_id        = data.azurerm_private_dns_zone.postgres.id
  resource_group_name        = module.resource_group.name
  subnet_id                  = data.azurerm_subnet.postgres.id
  zone                       = "shd"

  tags = {
    WorkloadType = "SharedServicesLZ/sonatype-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
