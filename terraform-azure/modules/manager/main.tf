resource "azurerm_public_ip" "publicip" {
  count               = var.machine_count
  name                = "manager-${count.index + 1}-publicip"
  location            = var.hadoop_resource.location
  resource_group_name = var.hadoop_resource.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "manager" {
  count               = var.machine_count
  name                = "manager-${count.index + 1}-nic"
  location            = var.hadoop_resource.location
  resource_group_name = var.hadoop_resource.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "manager" {
  name                = "manager-${count.index + 1}"
  resource_group_name = var.hadoop_resource.name
  location            = var.hadoop_resource.location
  size                = var.machine_type
  admin_username      = "adminuser"
  count               = var.machine_count
  network_interface_ids = [
    azurerm_network_interface.manager[count.index].id,
  ]

  tags = { 
    hadoop-machine-type = "manager"
  }

  admin_ssh_key {
    username   = var.user_name
    public_key = file(var.key_ssh)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "credativ"
    offer     = "debian"
    sku       = "9"
    version   = "latest"
  }
}

