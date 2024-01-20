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

variable "max_size_gb" {
  type    = number
  default = 32
}

variable "metric_categories" {
  type    = list(string)
  default = []
}

variable "retention_days" {
  type    = string
  default = "30"
}

variable "security_alert_email_addresses" {
  type    = list(string)
  default = []
}

variable "serverless_min_capacity" {
  type        = string
  default     = null
  description = "Minimum capacity for serverless SKUs. Minimum value is 0.5 (vCore)."
}

variable "serverless_auto_pause_delay" {
  type        = string
  default     = null
  description = "The auto-pause delay for serverless SKUs. Minimum value is 60 (minutes)."
}

variable "sql_database_collation" {
  type    = string
  default = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable "sql_database_sku" {
  type    = string
  default = "GP_Gen5_2"
}

variable "sql_server_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "threat_detection_policy" {
  type = object({
    retention_days                 = number
    email_account_admins           = bool
    security_alert_email_addresses = list(string)
    storage_account_access_key     = string
    storage_endpoint               = string
  })
  default = null
}

variable "zone" {
  type = string
}
