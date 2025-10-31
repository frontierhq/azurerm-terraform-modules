locals {
  application_stacks = {
    dotnet_version              = null
    java_version                = null
    node_version                = null
    powershell_core_version     = null
    python_version              = null
    use_custom_runtime          = null
    use_dotnet_isolated_runtime = null
  }

  application_stack = merge(local.application_stacks, var.application_stack)

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
