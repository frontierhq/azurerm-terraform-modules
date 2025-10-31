variable "allowed_ips" {
  type    = list(string)
  default = []
}

variable "authentication_failure_mode" {
  type    = string
  default = null
}

variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "local_authentication_enabled" {
  type    = bool
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
    "OperationLogs"
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

variable "partition_count" {
  type    = number
  default = 1
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "replica_count" {
  type    = number
  default = 1
}

variable "resource_group_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
