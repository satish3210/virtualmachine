resource "azurerm_subnet" "subnet1" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}