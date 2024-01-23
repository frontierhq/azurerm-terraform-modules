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

variable "retention_in_days" {
  type    = number
  default = 30
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
