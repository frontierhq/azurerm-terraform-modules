locals {
  failover_default_location = {
    default = {
      location       = var.location
      zone_redundant = var.zone_redundant
    }
  }

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
}
