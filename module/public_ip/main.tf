resource "azurerm_public_ip" "pip_vm" {
  for_each            = var.pips
 
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  tags = {
    environment = "dev"
  }
}

output "public_ip_ids" {
  description = "List of Public IP IDs"
  value = { for k, v in azurerm_public_ip.pip_vm : k => v.id }
}