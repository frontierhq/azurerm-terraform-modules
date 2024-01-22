# Data Factory

This module creates a [Cosmosdb sql Container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container).

## Usage

```hcl
module "cosmosdb_sql_container" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/cosmosdb-sql-container/[VERSION]/module.tar.gz//src"

  account_name        = module.cosmosdb_account.name
  database_name       = azurerm_cosmosdb_sql_database.main.name
  included_path       = ["/*"]
  name                = "documents"
  partition_key_path  = "/id"
  resource_group_name = module.resource_group.name
}
```

## Known issues

Attempting to set a value for analytical_storage_ttl results in an exception: "The input content is invalid - 'analyticalStorageTtl' is not a valid property in the current payload"
For now this value should remain `null`.

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
