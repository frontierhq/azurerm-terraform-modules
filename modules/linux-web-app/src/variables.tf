variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "application_stack" {
  type = map(string)
  default = {
    python_version = "3.11"
  }
}

variable "client_affinity_enabled" {
  type    = bool
  default = false
}

variable "enable_app_service_storage" {
  type    = string
  default = "true"
}

variable "environment" {
  type = string
}

variable "https_only" {
  type    = bool
  default = true
}

variable "identifier" {
  type = string
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type         = "SystemAssigned"
    identity_ids = []
  }
}

variable "instrumentation_key" {
  type    = string
  default = null
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "log_categories" {
  type = list(string)
  default = [
    "AppServiceConsoleLogs",
    "AppServiceHTTPLogs",
    "AppServicePlatformLogs",
    "AppServiceAuditLogs",
    "AppServicePlatformLogs"
  ]
}

variable "log_category_groups" {
  type    = list(string)
  default = []
}

variable "logs" {
  type = object({
    detailed_error_messages = bool
    failed_request_tracing  = bool
    retention_in_days       = number
    retention_in_mb         = number
  })
  default = {
    detailed_error_messages = false
    failed_request_tracing  = false
    retention_in_days       = 7
    retention_in_mb         = 25
  }
}

variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics"
  ]
}

variable "resource_group_name" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "site_config" {
  type = object({
    container_registry_managed_identity_client_id = optional(string, null)
    container_registry_use_managed_identity       = optional(bool, false)
    ftps_state                                    = optional(string, "Disabled")
    http2_enabled                                 = optional(bool, true)
    use_32_bit_worker                             = optional(bool, false)
    vnet_route_all_enabled                        = optional(bool, false)
    websockets_enabled                            = optional(bool, false)
    worker_count                                  = optional(number, null)
  })
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}

variable "zone_balancing_enabled" {
  type    = bool
  default = false
}
