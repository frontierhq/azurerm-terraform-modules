# Automation Runbook

This module creates an [Automation Runbook](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_runbook).

## Usage

```hcl
module "automation_runbook" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/automation-runbook/[VERSION]/module.tar.gz//src"

  environment         = "con"
  identifier          = "deallocatefirewall"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "pla"

  automation_account_name = module.automation_account.name
  content                 = data.local_file.runbook.content
  runbook_type            = "Python3"

  tags = {
    WorkloadType = "PlatformLZ/virtual-wan"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
