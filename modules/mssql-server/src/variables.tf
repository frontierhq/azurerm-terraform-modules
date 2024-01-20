variable "administrator_password" {
  type    = string
  default = null
}

variable "administrator_login" {
  type    = string
  default = null
}

variable "azuread_administrator" {
  type = object({
    azuread_authentication_only = bool
    login_username              = string
    object_id                   = string
  })
  default = null
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

variable "log_analytics_workspace_id" {
  type = string
}

variable "log_categories" {
  type    = list(string)
  default = []
}

variable "log_category_groups" {
  type    = list(string)
  default = []
}

variable "metric_categories" {
  type    = list(string)
  default = []
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
