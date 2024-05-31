locals {
  identifier = replace(lower(var.identifier), "/[^a-z1-9]/", "")
  location   = "global"

  tags = {
    Environment = var.environment
    Location    = local.location
    Zone        = var.zone
  }
}
