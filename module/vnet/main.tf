
resource "azurerm_virtual_network" "sunnyvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]

}

  

