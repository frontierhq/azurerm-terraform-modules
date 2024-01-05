variable "administrator_login" {
  type    = string
  default = "sqladmin"
}

variable "administrator_password" {
  type = string
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "environment" {
  type = string
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

# https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/resource-logs-categories#microsoftdatafactoryfactories
variable "log_categories" {
  type = list(string)
  default = [
    "MySqlAuditLogs",
    "MySqlSlowLogs"
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
  default = "Standard_D2ds_v4"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
