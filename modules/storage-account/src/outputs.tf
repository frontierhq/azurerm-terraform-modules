output "id" {
  value = azurerm_storage_account.main.id
}

output "name" {
  value = azurerm_storage_account.main.name
}

output "primary_access_key" {
  value = azurerm_storage_account.main.primary_access_key
}

output "primary_web_internet_endpoint" {
  value = azurerm_storage_account.main.primary_web_internet_endpoint
}

output "secondary_access_key" {
  value = azurerm_storage_account.main.secondary_access_key
}
