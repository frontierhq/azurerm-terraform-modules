variable "cross_region_restore_enabled" {
  type = bool
}

variable "datastore_type" {
  type    = string
  default = "VaultStore"
}

variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "immutability" {
  type    = string
  default = "Unlocked" # Locked, Unlocked or Disabled
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "redundancy" {
  type = string
}

variable "soft_delete" {
  type    = string
  default = "On" # AlwaysOn On Off
}

variable "service_workspace_id" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
