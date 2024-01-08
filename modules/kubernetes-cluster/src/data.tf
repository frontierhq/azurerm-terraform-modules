data "azurerm_virtual_network" "main" {
  name                = split("/", var.subnet_id)[8]
  resource_group_name = split("/", var.subnet_id)[4]
}
