#Configure virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group
  tags                = var.vnet_tags
}

resource "azurerm_subnet" "vnet_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.vnet_resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.ip_name
  resource_group_name = var.vnet_resource_group
  location            = var.vnet_location
  allocation_method   = "Static"

  tags = var.vnet_tags
}

resource "azurerm_network_interface" "vnet_sn_nic" {
  name                = var.network_interface_name
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = azurerm_subnet.vnet_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  depends_on = [
    azurerm_public_ip.public_ip
  ]
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group

  security_rule {
    name                       = var.nsg_security_rule_name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22","80"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.vnet_tags
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.vnet_sn_nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = azurerm_subnet.vnet_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
