terraform {
  required_version = "~> 1.5"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23"
    }
  }
}
