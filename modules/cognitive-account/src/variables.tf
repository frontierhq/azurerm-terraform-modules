variable "custom_subdomain_name" {
  type    = string
  default = null
}

variable "deployment" {
  type = map(object({
    name            = string
    model_format    = string
    model_name      = string
    model_version   = string
    scale_type      = string
    rai_policy_name = optional(string)
  }))
  default = {}
}

variable "dynamic_throttling_enabled" {
  type    = bool
  default = null
}

variable "environment" {
  type = string
}

variable "fqdns" {
  type    = list(string)
  default = null
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "identifier" {
  type = string
}

variable "kind" {
  type    = string
  default = "OpenAI"
}

variable "local_auth_enabled" {
  type    = bool
  default = true
}

variable "location" {
  type = string
}

variable "network_acls" {
  type = set(object({
    default_action = string
    ip_rules       = optional(set(string))
    virtual_network_rules = optional(set(object({
      subnet_id                            = string
      ignore_missing_vnet_service_endpoint = optional(bool, false)
    })))
  }))
  default = null
}

variable "outbound_network_access_restricted" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type        = string
  default     = "S0"
  description = "Possible values: `F0`, `F1`, `S0`, `S`, `S1`, `S2`, `S3`, `S4`, `S5`, `S6`, `P0`, `P1`, `P2`, `E0` and `DC0`"
}

variable "storage" {
  type = list(object({
    storage_account_id = string
    identity_client_id = optional(string)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
