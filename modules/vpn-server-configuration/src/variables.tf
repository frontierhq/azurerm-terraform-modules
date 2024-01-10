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

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpn_authentication_types" {
  type = list(string)
}

variable "vpn_protocols" {
  type = list(string)
}

variable "zone" {
  type = string
}
