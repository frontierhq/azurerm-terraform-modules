locals {
  identifier = replace(lower(var.identifier), "/[^a-z1-9]/", "")

  short_locations = {
    "uksouth" = "uks"
    "ukwest"  = "ukw"
  }

  tags = {
    Environment     = var.environment
    WorkloadName    = var.workload_name
    WorkloadType    = var.workload_type
    WorkloadVersion = var.workload_version
  }
}
