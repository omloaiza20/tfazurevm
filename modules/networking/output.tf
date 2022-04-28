output "vnet_name" {
    value = azurerm_virtual_network.vnet.name
}

output "network_interface_id" {
    value = azurerm_network_interface.vnet_sn_nic.id
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

