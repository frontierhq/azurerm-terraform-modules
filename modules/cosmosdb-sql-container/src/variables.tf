variable "analytical_storage_ttl" {
  type    = number
  default = null
}

variable "account_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "default_ttl" {
  type    = number
  default = 86400
}

variable "excluded_path" {
  type    = list(string)
  default = []
}

variable "included_path" {
  type    = list(string)
  default = []
}

variable "indexing_mode" {
  type    = string
  default = "consistent"
}

variable "name" {
  type = string
}

variable "partition_key_path" {
  type = string
}

variable "partition_key_version" {
  type    = number
  default = 1
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "throughput" {
  type    = string
  default = 400
}

variable "unique_key" {
  type    = list(string)
  default = []
}
