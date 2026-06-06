data "azurerm_virtual_network" "main" {
  name                = split("/", var.vnet_subnet_id)[8]
  resource_group_name = split("/", var.vnet_subnet_id)[4]
}

data "azurerm_user_assigned_identity" "main" {
  count = var.identity != null && var.identity.type == "UserAssigned" ? 1 : 0

  name                = split("/", var.identity.identity_ids[0])[8]
  resource_group_name = split("/", var.identity.identity_ids[0])[4]
}
