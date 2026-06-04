terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    # You can configure resource deletion behavior here if needed
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}