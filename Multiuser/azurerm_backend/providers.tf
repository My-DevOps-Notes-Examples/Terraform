terraform {
  required_version = "> 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "storage"
    storage_account_name = "terraformbackend3697"
    container_name = "terraform"
    key = "azurermbackend.terraform.tfstate"
  }
}

provider "azurerm" {
  features { }
}