variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "location" {
  type = string
}

variable "maximum_elastic_worker_count" {
  type    = number
  default = null
}

variable "os_type" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "worker_count" {
  type    = number
  default = null
}

variable "zone" {
  type = string
}

variable "zone_balancing_enabled" {
  type    = bool
  default = false
}
