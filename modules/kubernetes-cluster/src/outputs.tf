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
