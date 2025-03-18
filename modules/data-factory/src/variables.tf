variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type         = "SystemAssigned"
    identity_ids = []
  }
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
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}

variable "zone" {
  type = string
}
