# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.6"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "ee902f6d-01a9-4a32-8c5f-af9403e6c766"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
