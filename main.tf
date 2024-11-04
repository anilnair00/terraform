# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Testvm_group"
    storage_account_name = "testvmgroupb7e2"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}
}

# Provider Block
provider "azurerm" {
  features {}
  
  subscription_id = "ee902f6d-01a9-4a32-8c5f-af9403e6c766"
  client_id       = "084f318f-40aa-4d40-93ea-5ed3472b66bc"
  client_secret   = "UxS8Q~xZ6gqVHJlJlDbvM~-3BpEWwMmFpetXaaLD"
  tenant_id       = "abec7981-3822-4685-98b0-533aca20c2ed"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
