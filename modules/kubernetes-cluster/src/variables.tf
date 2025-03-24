variable "admin_group_object_ids" {
  type    = list(string)
  default = []
}

variable "auto_scaling_enabled" {
  type    = bool
  default = true
}

variable "authorized_ip_ranges" {
  type    = list(string)
  default = []
}

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

variable "kubernetes_version" {
  type = string
}

variable "load_balancer_sku" {
  type    = string
  default = "standard"
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-containerservice-managedclusters-logs
variable "log_categories" {
  type = list(string)
  default = [
    "kube-scheduler",
  ]
}

variable "log_category_groups" {
  type    = list(string)
  default = []
}

variable "metric_categories" {
  type = list(string)
  default = [
    "AllMetrics",
  ]
}

variable "network_plugin" {
  type    = string
  default = "azure"
}

variable "network_plugin_mode" {
  type    = string
  default = "overlay"
}

variable "network_policy" {
  type    = string
  default = "calico"
}

variable "node_count" {
  type    = number
  default = null
}

variable "node_max_count" {
  type    = number
  default = 3
}

variable "node_min_count" {
  type    = number
  default = 1
}

variable "outbound_type" {
  type    = string
  default = "loadBalancer"
}

variable "os_disk_size_gb" {
  type    = number
  default = 30
}

variable "os_disk_type" {
  type    = string
  default = "Ephemeral"
}

variable "os_sku" {
  type    = string
  default = "Ubuntu"
}

variable "pod_subnet_id" {
  type    = string
  default = null
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vm_size" {
  type    = string
  default = "Standard_B4ms"
}

variable "vnet_subnet_id" {
  type = string
}

variable "windows_profile" {
  type = object({
    admin_password = string
    admin_username = string
  })
  default = null
}

variable "zone" {
  type = string
}

variable "zones" {
  type = list(string)
  default = [
    "1",
    "2",
    "3"
  ]
}
