# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "eastus"
}

# Create the virtual network
resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    Environment = "Prod"
  }
}

# Create the subnet
resource "azurerm_subnet" "example" {
  name                 = "my-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
}
