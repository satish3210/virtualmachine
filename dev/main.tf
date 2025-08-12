module "rgname" {
  source = "../module/resource"
  rgname = "nishantrg"
  rglocation = "centralindia"
}

module "vnet_name" {
    depends_on = [ module.rgname ]
    rgname = "nishantrg"
  source    = "../module/vnet"
  vnet_name = "sunnyvnet"
  location  = "centralindia"
}
module "subnet1" {
  depends_on = [ module.vnet_name ]
  source     = "../module/subnet"
  subnetname = "subnet1"
  rgname     = "nishantrg"
  vnet_name  = "sunnyvnet"
  address_prefixes = ["10.0.1.0/24"]
}
module "pip1" {
  depends_on = [ module.rgname, module.vnet_name, module.subnet1 ]
  source = "../module/pip"
  pip_name = "frontendpip"
  location = "centralindia"
  rgname  = "nishantrg"
}

module "virtualmachine" {
  depends_on = [ module.rgname, module.vnet_name, module.subnet1, module.pip1 ]
  source              = "../module/virtualmachine"
  vm_name             = "frontend-vm"
  location            = "centralindia"
  rgname              = "nishantrg"
  subnetname          = "subnet1"
  vnet_name           = "sunnyvnet"
  pip_name            = "frontendpip"
   os_disk_storage_account_type = "Standard_LRS"
    os_image_publisher = "Canonical"
    os_image_offer = "0001-com-ubuntu-server-jammy"
    os_image_sku = "22_04-lts"
    
    nic = "frontend-nic"
    ip_configuration_name= "frontend-ip-config"

    admin_username = "adminuser"

    admin_password = "P@ssw0rd1234!"
}