resource "azurerm_network_interface" "nic1" {
  name                = var.nic
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rgname
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic1.id]

  
    os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.os_image_publisher
    offer     = var.os_image_offer
    sku       = var.os_image_sku
    version   = "latest"
  }
    custom_data = base64encode(<<EOF
#!/bin/bash
# Update and install NGINX
apt-get update -y
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx
EOF
  )
}
  