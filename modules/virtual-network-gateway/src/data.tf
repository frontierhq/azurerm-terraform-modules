data "azurerm_client_config" "main" {}

# See https://learn.microsoft.com/en-us/azure/vpn-gateway/openvpn-azure-ad-tenant#authorize-the-azure-vpn-application
data "azuread_service_principal" "azure_vpn" {
  display_name = "Azure VPN"
}
