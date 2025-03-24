data "azurerm_virtual_network" "main" {
  name                = split("/", var.vnet_subnet_id)[8]
  resource_group_name = split("/", var.vnet_subnet_id)[4]
}
