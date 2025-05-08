output "id" {
  value = azurerm_linux_function_app.main.id
}

output "custom_domain_verification_id" {
  value = azurerm_linux_function_app.main.custom_domain_verification_id
}

output "default_hostname" {
  value = azurerm_linux_function_app.main.default_hostname
}

output "hosting_environment_id" {
  value = azurerm_linux_function_app.main.hosting_environment_id
}

output "identity" {
  value = azurerm_linux_function_app.main.identity[*]
}

output "possible_outbound_ip_addresses" {
  value = azurerm_linux_function_app.main.possible_outbound_ip_addresses
}
