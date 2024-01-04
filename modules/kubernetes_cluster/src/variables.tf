variable "admin_group_object_ids" {
  type    = list(string)
  default = []
}

variable "authorized_ip_ranges" {
  type    = list(string)
  default = null
}

# variable "azure_rbac_enabled" {
#   type    = bool
#   default = true
# }

variable "enable_auto_scaling" {
  type    = bool
  default = true
}

variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "network_plugin" {
  type    = string
  default = "kubenet"
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

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vm_size" {
  type    = string
  default = "Standard_D2_v4"
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
