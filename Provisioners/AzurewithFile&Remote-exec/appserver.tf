resource "azurerm_linux_virtual_machine" "appserver" {
  name                  = var.server_info.appserver_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.server_rg.name
  size                  = "Standard_B1s"
  admin_username        = "nagas"
  admin_password        = "satish@1998"
  network_interface_ids = [azurerm_network_interface.server_nic.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  admin_ssh_key {
    username   = "nagas"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  disable_password_authentication = false
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    user        = "nagas"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip_address
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install apache2 -y"]
  }

  depends_on = [
    azurerm_network_interface_security_group_association.appserver_nicsg,
    azurerm_network_interface.server_nic
  ]
}