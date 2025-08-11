data "azurerm_subnet" "subnet1" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = var.vnet_name
}
data "azurerm_public_ip" "pip" {
  name                = var.pip_name    
  resource_group_name = var.rgname
}