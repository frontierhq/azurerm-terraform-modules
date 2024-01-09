variable "address_prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "hub_routing_preference" {
  type    = string
  default = "VpnGateway"
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

variable "sku" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "virtual_wan_id" {
  type = string
}

variable "zone" {
  type = string
}
