variable "base_policy_id" {
  type    = string
  default = null
}

variable "dns" {
  type = object({
    proxy_enabled = bool
    servers       = optional(list(string))
  })
  default = {
    proxy_enabled = false
    servers       = []
  }
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

variable "sku" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
