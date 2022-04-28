#Create Resource Group
resource "azurerm_resource_group" "main_resource_group" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

#Create Storage Account
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags

  depends_on = [
    azurerm_resource_group.main_resource_group
  ]
}
