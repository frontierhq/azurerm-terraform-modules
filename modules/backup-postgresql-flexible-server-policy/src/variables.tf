variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "location" {
  type = string
}

variable "backup_vault_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}


variable "tags" {
  type    = map(string)
  default = {}
}

variable "vault_policy" {
  type = object({
    policy_level = string
    frequency    = string
    time         = optional(string, "00:00")
    timezone     = optional(string, "UTC")

    retention_daily_count   = number
    retention_weekly_count  = number
    retention_monthly_count = number
    retention_yearly_count  = number

    weekdays = optional(list(string), ["Sunday"])
    weeks    = optional(list(string), ["First"])
    months   = optional(list(string), ["January"])
  })
}

variable "zone" {
  type = string
}
