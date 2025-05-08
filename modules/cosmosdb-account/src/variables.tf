variable "capabilities" {
  type    = list(string)
  default = []
}

variable "consistency_level" {
  type    = string
  default = "BoundedStaleness"
}

variable "enable_automatic_failover" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "failover_locations" {
  type    = map(map(string))
  default = null
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

variable "identifier" {
  type = string
}

variable "ip_range_filter" {
  type    = list(string)
  default = []
}

variable "is_virtual_network_filter_enabled" {
  type    = bool
  default = false
}

variable "kind" {
  type    = string
  default = "GlobalDocumentDB"
}

variable "location" {
  type = string
}

variable "max_interval_in_seconds" {
  type    = number
  default = 5
}

variable "max_staleness_prefix" {
  type    = number
  default = 100
}

variable "mongo_server_version" {
  type    = string
  default = null
}

variable "network_acl_bypass_for_azure_services" {
  type    = bool
  default = false
}

variable "network_acl_bypass_ids" {
  type    = list(string)
  default = null
}

variable "offer" {
  type    = string
  default = "Standard"
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_network_rule" {
  type = list(object({
    id                                   = string,
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = null
}

variable "zone" {
  type = string
}

variable "zone_redundant" {
  type    = bool
  default = false
}
