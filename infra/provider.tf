terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storageaccountname
    container_name       = var.containername
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}
