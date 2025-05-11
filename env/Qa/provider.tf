terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "golu"
  #   storage_account_name = "golust" # must be globally unique
  #   container_name       = "goluct"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  subscription_id ="560c4084-d1b8-4c7a-874f-276b5dadd098"
  features {

  }
}
