terraform {
  required_version = "~> 1.5"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.11"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23"
    }
  }
}
