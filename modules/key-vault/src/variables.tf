variable "bypass" {
  type    = string
  default = "None"
}

variable "default_action" {
  type    = string
  default = "Deny"
}

variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "ip_rules" {
  type    = list(string)
  default = []
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-keyvault-vaults-logs
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

variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics",
  ]
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "tenant_id" {
  type = string
}

variable "virtual_network_subnet_ids" {
  type    = list(string)
  default = []

}

variable "zone" {
  type = string
}
