##Configure Terraform
terraform {
    required_version = ">=1.0"
    required_providers {
        azurerm = {
            source           = "hashicorp/azurerm"
            version          = "=3.0.0"
        }
    }
    backend "azurerm" {
        resource_group_name  = "RGtfstate"
        storage_account_name = "satfstatemlm"
        container_name       = "tfstatecontainer"
        key                  = "terraform.tfstate"
    }
}

