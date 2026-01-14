variable "environment" {
  description = "Deployment environment (e.g. dev, test, prod)."
  type        = string
}

variable "identifier" {
  description = "Unique identifier to ensure resource name uniqueness."
  type        = string
}

variable "location" {
  description = "Azure region where the Recovery Services Vault will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "sku" {
  description = "SKU of the Recovery Services Vault."
  type        = string
  default     = "Standard"
}

variable "immutability" {
  description = "Immutability state of the vault."
  type        = string
  default     = "Unlocked"
}

variable "identity_ids" {
  description = "List of User Assigned Identity IDs."
  type        = list(string)
}

variable "storage_mode_type" {
  description = "Storage mode type for the vault."
  type        = string
  default     = "GeoRedundant"
}

variable "soft_delete_enabled" {
  description = "Enable soft delete."
  type        = bool
  default     = true
}

variable "cross_region_restore_enabled" {
  description = "Enable cross-region restore."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Allow public network access."
  type        = bool
  default     = true
}

variable "sentinel_workspace_id" {
  type    = string
  default = ""
}

variable "service_workspace_id" {
  type    = string
  default = ""
}

variable "tags" {
  description = "Tags to apply to the Recovery Services Vault."
  type        = map(string)
  default     = {}
}

variable "zone" {
  description = "Azure availability zone."
  type        = string
}
