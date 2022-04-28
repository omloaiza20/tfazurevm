name = "RG-TerraformLab08"
location = "westeurope"
tags = {
    "Environment" = "Development"
    "Owner" = "Mloaiza"
}
storage_account_name = "savmlab08ml"
vnet_name = "Vnet-VMLab"
vnet_address_space = ["10.0.0.0/16"]
vnet_tags = {
    "Environment" = "Development"
    "Owner" = "Mloaiza"    
}
subnet_name = "SN-VMLab"
subnet_address_prefix = ["10.0.2.0/24"]
network_interface_name = "NIC_VMLab"
ip_name = "IP-VMLab"
network_security_group_name = "NSG-VMLab"
nsg_security_rule_name = "Allow SSH Connection"
vm_name = "myUbuntuVMLab"
vm_size_name = "Standard_DS1_v2"
os_disk_name = "myUbuntuVMLabDisk"
vm_username = "lab08user"
vm_publisher = "Canonical"
vm_offer = "UbuntuServer"
vm_sku = "18.04-LTS"
vm_version = "latest"