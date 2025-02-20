terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-ABB-DEMO"
    storage_account_name = "remotebackendabb"
    container_name       = "statefilesabb"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}
