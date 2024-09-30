# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = variable.resource_group_name
  location = variable.location
}
