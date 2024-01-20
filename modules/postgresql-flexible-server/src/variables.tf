variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type = string
}

variable "environment" {
  type = string
}

variable "high_availability_mode" {
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

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-dbforpostgresql-flexibleservers-logs
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
    "AllMetrics"
  ]
}

variable "postgres_version" {
  type    = string
  default = "12"
}

variable "private_dns_zone_id" {
  type    = string
  default = null
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
