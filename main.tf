#Version Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}


#Conexion
provider "azurerm" {
  # Configuration options
  features {

  }
  #   subscription_id = "311f8b85-98c3-410b-a39f-94aa3ba26577"
  #   client_id       = "cfd4fa88-7faa-47cf-a15a-b65c2672f1e0"
  #   client_secret   = "gUA8Q~8F6apxoZn_nSMkkYlXHWo7g8~Ow40x-dc6"
  #   tenant_id       = "9090fc5b-358a-429c-8961-f11418011054"
}



#Declaración de recursos
# Resource Group
resource "azurerm_resource_group" "demoRG" {
  name     = "rg-demo-tf-eus2"
  location = "West Europe"
  tags     = { LaunchDate = "12/02/2022" }
}

#Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vn-demo-we"
  location            = azurerm_resource_group.demoRG.location
  resource_group_name = azurerm_resource_group.demoRG.name
  address_space       = ["10.0.0.0/16"]
}
