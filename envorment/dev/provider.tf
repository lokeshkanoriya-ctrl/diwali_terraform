terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "79c26feb-0cf7-4c69-884b-12bcef586d4c"
}