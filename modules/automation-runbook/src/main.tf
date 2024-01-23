resource "azurerm_automation_runbook" "main" {
  name                    = "run-${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name

  content      = var.content
  description  = var.description
  log_progress = var.log_progress
  log_verbose  = var.log_verbose
  runbook_type = var.runbook_type

  tags = merge(var.tags, local.tags)
}
