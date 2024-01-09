variable "dns_servers" {
  type    = list(string)
  default = []
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

variable "resource_group_name" {
  type = string
}

variable "scale_unit" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_hub_id" {
  type = string
}

variable "vpn_client_address_pool_address_prefixes" {
  type = list(string)
}

variable "vpn_server_configuration_id" {
  type = string
}

variable "zone" {
  type = string
}
