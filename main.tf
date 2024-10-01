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
resource "null_resource" "install_azure_cli" {
  provisioner "local-exec" {
    command = <<EOT
      if ! az --version >nul 2>&1; then
        echo "Azure CLI not found. Installing..."
        powershell -Command "Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -ArgumentList '/I AzureCLI.msi /quiet' -Wait; Remove-Item .\AzureCLI.msi"
      else
        echo "Azure CLI is already installed."
      fi
    EOT
  }
}
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
