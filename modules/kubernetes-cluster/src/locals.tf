locals {
  identifier = replace(lower(var.identifier), "/[^a-z1-9]/", "")

  short_locations = {
    "uksouth" = "uks"
    "ukwest"  = "ukw"
  }

  tags = {
    Environment = var.environment
    Location    = var.location
    Zone        = var.zone
  }

  cluster_identity_principal_id = (
    var.identity != null && var.identity.type == "UserAssigned"
    ? data.azurerm_user_assigned_identity.main[0].principal_id
    : azurerm_kubernetes_cluster.main.identity[0].principal_id
  )
}
