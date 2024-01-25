variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "ZRS"
}

variable "allow_all_networks" {
  type    = string
  default = "false"
}

variable "allow_nested_items_to_be_public" {
  type    = string
  default = "false"
}

variable "allowed_copy_scope" {
  type    = string
  default = "AAD"
}

variable "cors_rules" {
  type = list(object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  }))
  default = null
}

variable "enable_https_traffic_only" {
  type    = string
  default = "true"
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

variable "is_hns_enabled" {
  type    = bool
  default = false
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "network_rules_bypass" {
  type = list(string)

  default = [
    "AzureServices",
    "Logging",
    "Metrics",
  ]
}

variable "network_rules_depends_on" {
  type    = list(any)
  default = []
}

variable "private_link_access" {
  type        = list(string)
  default     = []
  description = "List of resource IDs for resource instances."
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}


variable "resource_group_name" {
  type = string
}

variable "sftp_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_network_subnet_ids" {
  type    = list(string)
  default = []
}

variable "zone" {
  type = string
}
