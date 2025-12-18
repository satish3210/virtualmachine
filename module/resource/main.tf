resource "azurerm_resource_group" "satrg" {
  name     = var.rgname
  location = var.rglocation
}
