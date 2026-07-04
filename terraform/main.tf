provider "azurerm" {
  features {}
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

module "subnet" {
  source              = "./modules/subnet"
  subnet_name         = var.subnet_name
  resource_group_name = var.resource_group_name
  vnet_name           = module.vnet.vnet_name
  address_prefix      = var.subnet_prefix
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
}
