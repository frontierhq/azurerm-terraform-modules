# Kubernetes Cluster

This module creates a [Kubernetes Cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "kubernetes_cluster" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/kubernetes-cluster/[VERSION]/module.tar.gz//src"

  environment                = "dev"
  identifier                 = "sonatypeplatform"
  kubernetes_version         = "1.28.1
  location                   = "uksouth"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
  resource_group_name        = module.resource_group.name
  subnet_id                  = data.azurerm_subnet.k8s.id
  zone                       = "shd"

  tags = {
    WorkloadType = "SharedServicesLZ/sonatype-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
