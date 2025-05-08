variable "administrator_login" {
  type    = string
  default = "sqladmin"
}

variable "administrator_login_password" {
  type = string
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

variable "minimum_tls_version" {
  type    = string
  default = "1.2"
}

variable "resource_group_name" {
  type = string
}

variable "sql_server_version" {
  type    = string
  default = "12.0"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
