variable "environment" {
  type = string
}

variable "firewall_policy_id" {
  type    = string
  default = null
}

variable "identifier" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-network-azurefirewalls-logs
variable "log_categories" {
  type    = list(string)
  default = []
}

variable "log_category_groups" {
  type = list(string)
  default = [
    "allLogs"
  ]
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

variable "sku_name" {
  type    = string
  default = "AZFW_VNet"
}

variable "sku_tier" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_hub_id" {
  type    = string
  default = null
}

variable "zone" {
  type = string
}
