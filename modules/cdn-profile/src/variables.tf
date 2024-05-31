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
  default = "Standard_Microsoft"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
