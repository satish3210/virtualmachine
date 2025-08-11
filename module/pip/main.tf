resource "azurerm_public_ip" "pip1" {
  name                = var.pip_name
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Static"
}