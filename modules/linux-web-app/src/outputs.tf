output "custom_domain_verification_id" {
  value = azurerm_linux_web_app.main.custom_domain_verification_id
}

output "default_hostname" {
  value = azurerm_linux_web_app.main.default_hostname
}

output "hosting_environment_id" {
  value = azurerm_linux_web_app.main.hosting_environment_id
}

output "id" {
  value = azurerm_linux_web_app.main.id
}

output "identity" {
  value = azurerm_linux_web_app.main.identity[*]
}

output "name" {
  value = azurerm_linux_web_app.main.name
}

output "outbound_ip_addresses" {
  value = azurerm_linux_web_app.main.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  value = azurerm_linux_web_app.main.possible_outbound_ip_addresses
}
