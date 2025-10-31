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

  has_subnets  = coalescelist(var.virtual_network_subnet_ids, []) > 0
  has_ip_rules = coalescelist(var.ip_rules, []) > 0
}
