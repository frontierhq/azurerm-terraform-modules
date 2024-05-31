variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "ZRS"
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

variable "metric_categories" {
  type = list(string)
  default = [
    "Capacity",
    "Transaction"
  ]
}

variable "resource_group_name" {
  type = string
}

variable "static_website" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
