variable "admin_enabled" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
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

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-containerregistry-registries-logs
variable "log_categories" {
  type    = list(string)
  default = []
}

variable "log_category_groups" {
  type = list(string)
  default = [
    "audit"
  ]
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-metrics/microsoft-containerregistry-registries-metrics
variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics",
  ]
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
