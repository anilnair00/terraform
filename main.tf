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
# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "ee902f6d-01a9-4a32-8c5f-af9403e6c766"
  client_id       = "084f318f-40aa-4d40-93ea-5ed3472b66bc"
  client_secret   = "UxS8Q~xZ6gqVHJlJlDbvM~-3BpEWwMmFpetXaaLD"
  tenant_id       = "abec7981-3822-4685-98b0-533aca20c2ed"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
    name                = var.nsg
    location            = var.location
    resource_group_name = var.resource_group_name

    security_rule {
        name                       = "HTTP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
	security_rule {
        name                       = "RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
