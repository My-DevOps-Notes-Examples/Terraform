resource "azurerm_resource_group" "multiuser" {
  name = "multiuser"
  location = "eastus"

  tags = {
    CreatedBy = "Terraform"
  }
}