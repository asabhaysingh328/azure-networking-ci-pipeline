variable "resource_group_name" {
  default = "tf-networking-rg"
}

variable "location" {
  default = "eastus"
}

variable "vnet_name" {
  default = "tf-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "tf-subnet"
}

variable "subnet_prefix" {
  default = "10.0.1.0/24"
}

variable "nsg_name" {
  default = "tf-nsg"
}
