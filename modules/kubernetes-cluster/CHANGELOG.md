# Changelog

## 4.0
* Updated the required Terraform version from `1.5` to `1.11`.
* Updated the AzureRM Terraform provider version from `3.x` to `4.x`.
* Changed the default CNI plugin from `kubenet` to `azure`.
* Renamed `subnet_id` variable to `vnet_subnet_id`.

## 3.0
* Added `os_disk_size_gb`, `os_disk_type` and `os_sku` variables to enable greater default node pool customisation.
* Changed default node pool VM OS disk type to `Ephemeral`.
* Changed default VM size to `Standard_B4ms`.

## 2.0
* Added `log_categories` and `metric_categories` variables to enable configuration of Diagnostic Settings.
* Changed default log categories.

## 1.2
* Added support for using an internal load balancer by granting the cluster managed identity the `Reader` and `Network Contributor` roles on the virtual network.

## 1.1
* Added `node_resource_group_id` output.
