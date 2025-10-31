# Cognitive Account

This module creates a [Cognitive Account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "cognitive_account" "main" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/cognitive-services/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  resource_group_name = module.resource_group.name
  zone                = "mtg"

  tags = {
    WorkloadType = "MortgagesLZ/ai-services"
  }
}
```

## Known issues

You may need to agree to a code of conduct before you can deploy this service. See this [Microsoft article](https://learn.microsoft.com/en-us/legal/cognitive-services/openai/code-of-conduct) for more information.

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
