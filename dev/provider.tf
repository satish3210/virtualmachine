terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
backend "azurerm" {
    resource_group_name  = "satrg"
    storage_account_name = "storage5522"
    container_name       = "cont1"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
features {}
subscription_id = "18f8e7c5-a3db-4324-b49d-7ef07eace03f"
}
