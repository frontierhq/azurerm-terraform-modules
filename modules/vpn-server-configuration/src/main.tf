resource "azurerm_vpn_server_configuration" "main" {
  name                = "vpnconfig-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location            = var.location
  resource_group_name = var.resource_group_name

  vpn_authentication_types = var.vpn_authentication_types
  vpn_protocols            = var.vpn_protocols

  azure_active_directory_authentication {
    audience = data.azuread_service_principal.azure_vpn.client_id
    issuer   = "https://sts.windows.net/${data.azurerm_client_config.main.tenant_id}/"
    tenant   = "https://login.microsoftonline.com/${data.azurerm_client_config.main.tenant_id}/"
  }

  tags = merge(var.tags, local.tags)
}
