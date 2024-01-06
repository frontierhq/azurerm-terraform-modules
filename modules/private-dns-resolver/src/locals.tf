locals {
  identifier                          = replace(lower(var.identifier), "/[^a-z1-9]/", "")
  virtual_network_resource_group_name = split("/", var.virtual_network_id)[4]
  virtual_network_name                = split("/", var.virtual_network_id)[8]

  short_locations = {
    "uksouth" = "uks"
    "ukwest"  = "ukw"
  }

  tags = {
    Environment = var.environment
    Location    = var.location
    Zone        = var.zone
  }
}
