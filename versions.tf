terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.21.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.0"
    }
  }
  required_version = ">= 1.0"
}
