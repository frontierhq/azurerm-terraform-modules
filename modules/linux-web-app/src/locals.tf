locals {

  application_stacks = {
    docker_image        = null
    docker_image_tag    = null
    dotnet_version      = null
    go_version          = null
    java_server         = null
    java_server_version = null
    java_version        = null
    node_version        = null
    php_version         = null
    python_version      = null
    ruby_version        = null
  }

  application_stack = merge(local.application_stacks, var.application_stack)

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY      = var.instrumentation_key
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.enable_app_service_storage
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
