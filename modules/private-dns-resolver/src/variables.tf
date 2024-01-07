variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "inbound_endpoint_subnet_id" {
  type    = string
  default = null
}

variable "location" {
  type = string
}

variable "outbound_endpoint_subnet_id" {
  type    = string
  default = null
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

variable "virtual_network_id" {
  type = string
}

variable "zone" {
  type = string
}
