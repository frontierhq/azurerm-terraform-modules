output "connection_strings" {
  value     = azurerm_cosmosdb_account.main.connection_strings
  sensitive = true
}

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

output "primary_readonly_master_key" {
  value     = azurerm_cosmosdb_account.main.primary_readonly_key
  sensitive = true
}

output "read_endpoints" {
  value = azurerm_cosmosdb_account.main.read_endpoints
}

output "secondary_master_key" {
  value     = azurerm_cosmosdb_account.main.secondary_key
  sensitive = true
}

output "secondary_readonly_master_key" {
  value     = azurerm_cosmosdb_account.main.secondary_readonly_key
  sensitive = true
}

output "write_endpoints" {
  value = azurerm_cosmosdb_account.main.write_endpoints
}
