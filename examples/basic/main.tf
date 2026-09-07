terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.4"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../"

  project_name = "projecta"
  environment  = "dev"
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}