module "resource_group" {
  source = "./modules/base"
  name = var.name
  location = var.location
  tags = var.tags
  storage_account_name = var.storage_account_name
}


module "networking" {
  source = "./modules/networking"
  vnet_resource_group = module.resource_group.resource_group_name
  vnet_location = module.resource_group.resource_group_location
  vnet_tags = var.vnet_tags
  ip_name = var.ip_name
  network_security_group_name =  var.network_security_group_name
  nsg_security_rule_name = var.nsg_security_rule_name
  vnet_address_space = var.vnet_address_space
  subnet_address_prefix = var.subnet_address_prefix
  subnet_name = var.subnet_name
  vnet_name = var.vnet_name
  network_interface_name = var.network_interface_name

  depends_on = [
    module.resource_group
  ]
}

module "virtualmachine" {
  source = "./modules/virtual_machine"
  vm_resource_group = module.resource_group.resource_group_name
  vm_location = module.resource_group.resource_group_location
  vm_name = var.vm_name
  vm_size_name = var.vm_size_name
  vm_nic_ids = [module.networking.network_interface_id]
  os_disk_name = var.os_disk_name
  vm_username = var.vm_username
  vm_storage = module.resource_group.storage_account_primary_blob_endpoint
  vm_offer = var.vm_offer
  vm_publisher = var.vm_publisher
  vm_sku = var.vm_sku
  vm_version = var.vm_version

  depends_on = [
    module.networking
  ]
}