output "fqdn" {
  value = azurerm_kubernetes_cluster.main.fqdn
}

output "id" {
  value = azurerm_kubernetes_cluster.main.id
}

output "identity" {
  value = azurerm_kubernetes_cluster.main.identity
}

output "key_vault_secrets_provider" {
  value = azurerm_kubernetes_cluster.main.key_vault_secrets_provider
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive = true
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.main.node_resource_group
}

output "node_resource_group_id" {
  value = "${split(var.resource_group_name, azurerm_kubernetes_cluster.main.id)[0]}${azurerm_kubernetes_cluster.main.node_resource_group}"
}
