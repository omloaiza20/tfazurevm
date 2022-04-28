output "vm_name" {
  value     = azurerm_linux_virtual_machine.mycentosvm.computer_name
}

output "vm_username" {
  value     = azurerm_linux_virtual_machine.mycentosvm.admin_username
}

output "tls_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "tls_public_key_openssh" {
  value     = tls_private_key.ssh_key.public_key_openssh
  sensitive = true
}

output "tls_public_key" {
  value     = tls_private_key.ssh_key.public_key_pem
  sensitive = true
}