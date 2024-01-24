variable "application_insights_connection_string" {
  type    = string
  default = null
}

variable "application_insights_key" {
  type    = string
  default = null
}

variable "always_on" {
  type    = bool
  default = true
}

variable "application_stack" {
  type = map(string)
  default = {
    python_version = "3.11"
  }
}

variable "app_settings" {
  type    = map(any)
  default = {}
}

variable "client_certificate_enabled" {
  type    = bool
  default = false
}

variable "client_certificate_exclusion_paths" {
  type    = string
  default = null
}

variable "client_certificate_mode" {
  type    = string
  default = null
}

variable "environment" {
  type = string
}

variable "functions_extension_version" {
  type    = string
  default = "~4"
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

variable "ip_restriction" {
  type    = list(map(string))
  default = []
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
    "FunctionAppLogs"
  ]
}

variable "log_category_groups" {
  type    = list(string)
  default = []
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

variable "storage_account_access_key" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_network_subnet_id" {
  type    = string
  default = null
}

variable "vnet_route_all_enabled" {
  type    = bool
  default = false
}

variable "zone" {
  type = string
}
