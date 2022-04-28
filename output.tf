output "resource_group_name" {
    value = module.resource_group.resource_group_name
}

output "resource_group_location" {
    value = module.resource_group.resource_group_location
}

output "storage_account_primary_blob_endpoint" {
    value = module.resource_group.storage_account_primary_blob_endpoint
}

output "vnet_name" {
    value = module.networking.vnet_name
}

output "network_interface_id" {
    value = module.networking.network_interface_id
}

output "public_ip_address" {
  value = module.networking.public_ip_address
}

output "vm_name" {
  value     = module.virtualmachine.vm_name
}

output "vm_username" {
  value     = module.virtualmachine.vm_username
}

output "tls_private_key" {
  value     = module.virtualmachine.tls_private_key
  sensitive = true
}

output "tls_public_key_openssh" {
  value     = module.virtualmachine.tls_public_key_openssh
  sensitive = true
}

output "tls_public_key" {
  value     = module.virtualmachine.tls_public_key
  sensitive = true
}