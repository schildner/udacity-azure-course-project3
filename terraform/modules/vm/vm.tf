resource "azurerm_network_interface" "test" {
  #count               = var.number_of_vms
  #name                = "nic-${count.index}"
  
  name                = "nic0"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id_test
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.instance_ids
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  #count                           = var.number_of_vms
  #name                            = "vm-${count.index}"
  
  name                            = "vm0"
  resource_group_name             = var.resource_group
  location                        = var.location
  size                            = "Standard_B1s"
  admin_username                  = var.username
  #admin_password                  = var.password
  #source_image_id                 = var.packer_image
  #disable_password_authentication = false
  
  network_interface_ids = [
    #element(azurerm_network_interface.test.*.id, count.index)
    azurerm_network_interface.test.id
  ]

  admin_ssh_key {
    username   = "eduard"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags = {
    project_name = "QA"
    stage        = "Submission"
  }
}

#resource "azurerm_linux_virtual_machine" "test" {
#  name                = "ubuntu1604vm"
#  count               = var.number_of_vms
#  location            = var.location
#  resource_group_name = var.resource_group
#  size                = "Standard_B1s"
#  admin_username      = var.username
#  
#  network_interface_ids = [
#    element(azurerm_network_interface.test.*.id, count.index)
#  ]
#  admin_ssh_key {
#    username   = "eduard"
#    public_key = file("~/.ssh/id_rsa.pub")
#  }
#
#  os_disk {
#    caching           = "ReadWrite"
#    storage_account_type = "Standard_LRS"
#  }
#
#  source_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#}