resource "azurerm_network_security_group" "nsg_vm" {
  for_each            = var.nsgs
 
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.security_rule != null ? [each.value.security_rule] : []
    content {
      name                       = each.value.security_rule.name
      priority                   = each.value.security_rule.priority
      direction                  = each.value.security_rule.direction
      access                     = each.value.security_rule.access
      protocol                   = each.value.security_rule.protocol
      source_port_range          = each.value.security_rule.source_port_range
      destination_port_range     = each.value.security_rule.destination_port_range
      source_address_prefix      = each.value.security_rule.source_address_prefix
      destination_address_prefix = each.value.security_rule.destination_address_prefix
    }
  }
}