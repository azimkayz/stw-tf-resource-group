terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../"

  project_name = "stw"
  environment  = "dev"
  location     = "southafricanorth"
  tags = {
    owner = "cloud-team"
  }
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}
