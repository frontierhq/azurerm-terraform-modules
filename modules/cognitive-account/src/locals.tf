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
}
