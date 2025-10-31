output "endpoint" {
  value = azurerm_cosmosdb_account.main.endpoint
}

output "id" {
  value = azurerm_cosmosdb_account.main.id
}

output "name" {
  value = azurerm_cosmosdb_account.main.name
}

output "primary_master_key" {
  value     = azurerm_cosmosdb_account.main.primary_key
  sensitive = true
}

output "primary_mongodb_connection_string" {
  value     = azurerm_cosmosdb_account.main.primary_mongodb_connection_string
  sensitive = true
}

output "primary_readonly_master_key" {
  value     = azurerm_cosmosdb_account.main.primary_readonly_key
  sensitive = true
}

output "primary_readonly_mongodb_connection_string" {
  value     = azurerm_cosmosdb_account.main.primary_mongodb_connection_string
  sensitive = true
}

output "primary_readonly_sql_connection_string" {
  value     = azurerm_cosmosdb_account.main.primary_readonly_sql_connection_string
  sensitive = true
}

output "primary_sql_connection_string" {
  value     = azurerm_cosmosdb_account.main.primary_readonly_sql_connection_string
  sensitive = true
}

output "read_endpoints" {
  value = azurerm_cosmosdb_account.main.read_endpoints
}

output "secondary_master_key" {
  value     = azurerm_cosmosdb_account.main.secondary_key
  sensitive = true
}

output "secondary_mongodb_connection_string" {
  value     = azurerm_cosmosdb_account.main.secondary_mongodb_connection_string
  sensitive = true
}

output "secondary_readonly_master_key" {
  value     = azurerm_cosmosdb_account.main.secondary_readonly_key
  sensitive = true
}

output "secondary_readonly_mongodb_connection_string" {
  value     = azurerm_cosmosdb_account.main.secondary_mongodb_connection_string
  sensitive = true
}

output "secondary_readonly_sql_connection_string" {
  value     = azurerm_cosmosdb_account.main.secondary_readonly_sql_connection_string
  sensitive = true
}

output "secondary_sql_connection_string" {
  value     = azurerm_cosmosdb_account.main.secondary_sql_connection_string
  sensitive = true
}

output "write_endpoints" {
  value = azurerm_cosmosdb_account.main.write_endpoints
}
