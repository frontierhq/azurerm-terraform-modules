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

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-network-virtualnetworkgateways-logs
variable "log_categories" {
  type    = list(string)
  default = []
}

variable "log_category_groups" {
  type = list(string)
  default = [
    "Audit",
  ]
}

variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics",
  ]
}

variable "public_ip_address_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "VpnGw1"
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "type" {
  type    = string
  default = "Vpn"
}

variable "vpn_client_configuration_address_space" {
  type    = list(string)
  default = []
}

variable "zone" {
  type = string
}
