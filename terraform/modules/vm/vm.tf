module "network" {
  source = "../network"
}
module "publicip" {
  source = "../publicip"
}
resource "azurerm_network_interface" "test" {
  #count               = var.number_of_vms
  name                = "${var.prefix}-nic #-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.subnet_id_test
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = module.publicip.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "ubuntu1604vm"
  #count               = var.number_of_vms
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_B1s"
  admin_username      = var.username
  network_interface_ids = [
    #element(azurerm_network_interface.main.*.id, count.index)
  ]
  admin_ssh_key {
    username   = "eduard"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "main" {
  count                           = var.number_of_vms
  name                            = "${var.prefix}-vm-${count.index}"
  resource_group_name             = module.resource_group.resource_group_name
  location                        = var.location
  size                            = "Standard_B1s"
  
  admin_password                  = var.password
  #source_image_id                 = var.packer_image
  disable_password_authentication = false

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  tags = {
    project_name = "QA"
    stage        = "Submission"
  }
}