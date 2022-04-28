variable "vnet_name" {
    description = "Represents RG Name"
    type = string
}

variable "vnet_address_space" {
    description = "address_space of the Vnet"
    type = list
}

variable "vnet_tags" {}

variable "subnet_name" {}

variable "subnet_address_prefix" {
    type = list
}

variable "network_interface_name" {}

variable "ip_name" {}

variable "network_security_group_name" {}

variable "nsg_security_rule_name" {}

variable "vnet_resource_group" {
    type = string
}

variable "vnet_location" {
    type = string
}