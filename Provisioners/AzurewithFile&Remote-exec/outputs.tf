output "appserver_url" {
  value = "http://${azurerm_linux_virtual_machine.appserver.public_ip_address}"
}