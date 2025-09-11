variable "automation_account_name" {
  type = string
}

variable "content" {
  type = string
}

variable "description" {
  type    = string
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

variable "log_progress" {
  type    = bool
  default = true
}

variable "log_verbose" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type = string
}

variable "runbook_type" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
