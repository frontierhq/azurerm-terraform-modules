resource "azurerm_mssql_server" "main" {

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
  location                     = var.location
  name                         = "mssql-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  resource_group_name          = var.resource_group_name
  version                      = var.sql_server_version

  tags = merge(var.tags, local.tags)
}
