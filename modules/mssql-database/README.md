# MS SQL Database

This module creates a [MS SQL Database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) and associated [Diagnostic Setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting).

## Usage

```hcl
module "mssql_database" {
  source = "https://github.com/gofrontier-com/azurerm-terraform-modules/releases/download/mssql-database/[VERSION]/module.tar.gz//src"

  environment         = "dev"
  identifier          = "mortgages"
  location            = "uksouth"
  zone                = "mtg"

  threat_detection_policy = {
    retention_days                 = 10
    email_account_admins           = true
    security_alert_email_addresses = ["email@example.com"]
    storage_account_access_key     = "abc123"
    storage_endpoint               = "endpoint"
  }

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  tags = {
    WorkloadType = "MortgagesLZ/data-platform"
  }
}
```

## Known issues

_None._

## Contributing

See <https://github.com/gofrontier-com/azurerm-terraform-modules/blob/main/README.rst#contributing>.
