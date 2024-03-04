variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "identity_ids" {
  type    = list(string)
  default = []
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/resource-logs-categories#microsoftdatafactoryfactories
variable "log_categories" {
  type = list(string)
  default = [
    "ActivityRuns",
    "PipelineRuns",
    "TriggerRuns",
    "SandboxPipelineRuns",
    "SandboxActivityRuns",
  ]
}

variable "log_category_groups" {
  type    = list(string)
  default = []
}

variable "managed_virtual_network_enabled" {
  type    = bool
  default = false
}

variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics",
  ]
}

variable "public_network_enabled" {
  type    = bool
  default = true
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vsts_configuration" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}
