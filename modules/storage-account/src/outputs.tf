output "id" {
  value = azurerm_storage_account.main.id
}

output "name" {
  value = azurerm_storage_account.main.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.main.primary_access_key
  sensitive = true
}

output "primary_connection_string" {
  value     = azurerm_storage_account.main.primary_connection_string
  sensitive = true
}

output "primary_web_host" {
  value = azurerm_storage_account.main.primary_web_host
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.main.primary_web_endpoint
}
