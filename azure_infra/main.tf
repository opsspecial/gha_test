terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "89850c13-6af9-4fcd-98a4-7dcd0e0bf65c"
}

resource "azurerm_resource_group" "myapp" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags

}

