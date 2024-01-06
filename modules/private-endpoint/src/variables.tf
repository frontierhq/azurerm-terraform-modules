variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "location" {
  type = string
}

variable "private_connection_resource_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "subresource_names" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
