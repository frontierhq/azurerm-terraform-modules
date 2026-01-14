variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "location" {
  type = string
}

variable "policy_type" {
  type    = string
  default = "V1"
}

variable "recovery_vault_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vault_policy" {
  type = object({
    policy_level = string
    frequency    = string
    time         = optional(string, "00:00")
    timezone     = optional(string, "UTC")

    instant_restore_retention_days = optional(number)
    retention_daily_count          = number
    retention_weekly_count         = number
    retention_monthly_count        = number
    retention_yearly_count         = number

    weekdays = optional(string, "Sunday")
    weeks    = optional(string, "First")
    months   = optional(string, "January")
  })
}

variable "zone" {
  type = string
}
