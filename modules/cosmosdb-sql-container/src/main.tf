resource "azurerm_cosmosdb_sql_container" "main" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  account_name           = var.account_name
  database_name          = var.database_name
  partition_key_path     = var.partition_key_path
  partition_key_version  = var.partition_key_version
  throughput             = var.throughput
  default_ttl            = var.default_ttl
  analytical_storage_ttl = var.analytical_storage_ttl

  indexing_policy {
    dynamic "included_path" {
      for_each = toset(var.included_path)
      content {
        path = included_path.key
      }
    }

    dynamic "excluded_path" {
      for_each = toset(var.excluded_path)
      content {
        path = excluded_path.key
      }
    }

    indexing_mode = var.indexing_mode
  }

  dynamic "unique_key" {
    for_each = toset(var.unique_key)
    content {
      paths = unique_key.key
    }
  }
}
