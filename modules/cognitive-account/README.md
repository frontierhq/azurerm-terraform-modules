# Cognitive Services Account

This module creates a [Cognitive Services Account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account).

## Usage

```hcl
module "azurerm_cognitive_account" "main" {
  name                               = "cog-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  kind                               = "ImmersiveReader"
  location                           = "uksouth"
  resource_group_name                = module.resource_group_name
  sku_name                           = "S3"
  custom_subdomain_name              = var.custom_subdomain_name
  dynamic_throttling_enabled         = true
  fqdns                              = var.fqdns
  local_auth_enabled                 = var.local_auth_enabled
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = false

  tags = WorkloadType = "MortgagesLZ/data-platform"
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
