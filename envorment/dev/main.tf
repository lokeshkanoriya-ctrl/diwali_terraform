# module "resource_group" {
#   source = "../../module/resource_group"
#   rgs    = var.rgs_pv
# }

# module "storage_account" {
#   source     = "../../module/storage_account"
#   depends_on = [module.resource_group]
#   stgs       = var.stgs_pv
# }


# module "virtual_network" {
#   source     = "../../module/virtual_network"
#   depends_on = [module.resource_group]
#   vnets      = var.vnets_pv
# }

# module "compute" {
#   source     = "../../module/compute"
#   depends_on = [module.virtual_network]
#   vms        = var.vms_pv    
# }


# module "subnet" {
#   source     = "../../module/subnet"
#   depends_on = [module.virtual_network]
#   subnets    = var.subnets_pv
# }

# module "public_ip" {
#   source     = "../../module/public_ip"
#   depends_on = [module.resource_group]
#   pips       = var.pips_pv
# }

# module "network_security_group" {
#   source     = "../../module/network_security_group"
#   depends_on = [module.resource_group]
#   nsgs       = var.nsgs_pv
# }

# module "network_interface" {
#   source     = "../../module/network_interface"
#   depends_on = [module.subnet]
#   nics       = var.nics_pv
# }

































































































# resource "azurerm_resource_group" "rg_test" {
#   for_each = var.rgs
#   name     = each.value.name
#   location = each.value.location
# }

# resource "azurerm_storage_account" "stg121" {
#   for_each                 = var.stgs
#   depends_on               = [azurerm_resource_group.rg_test]
#   name                     = each.value.name
#   resource_group_name      = each.value.resource_group_name
#   location                 = each.value.location
#   account_tier             = each.value.account_tier
#   account_replication_type = each.value.account_replication_type

#   tags = {
#     environment = "dev"
#   }
# }

# resource "azurerm_virtual_network" "vnet_vm" {
#   depends_on          = [azurerm_resource_group.rg_test]
#   for_each            = var.vnets
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.address_space

# }
# resource "azurerm_subnet" "subnet_vm" {
#   for_each             = var.subnets
#   depends_on           = [azurerm_virtual_network.vnet_vm]
#   name                 = each.value.name
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
#   address_prefixes     = each.value.address_prefixes

# }


# resource "azurerm_public_ip" "pip_vm" {
#   for_each            = var.pips
#   depends_on          = [azurerm_resource_group.rg_test]
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   allocation_method   = each.value.allocation_method

#   tags = {
#     environment = "dev"
#   }
# }

# resource "azurerm_network_security_group" "nsg_vm" {
#   for_each            = var.nsgs
#   depends_on          = [azurerm_resource_group.rg_test]
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   dynamic "security_rule" {
#     for_each = each.value.security_rule != null ? [each.value.security_rule] : []
#     content {
#       name                       = each.value.security_rule.name
#       priority                   = each.value.security_rule.priority
#       direction                  = each.value.security_rule.direction
#       access                     = each.value.security_rule.access
#       protocol                   = each.value.security_rule.protocol
#       source_port_range          = each.value.security_rule.source_port_range
#       destination_port_range     = each.value.security_rule.destination_port_range
#       source_address_prefix      = each.value.security_rule.source_address_prefix
#       destination_address_prefix = each.value.security_rule.destination_address_prefix
#     }
#   }
# }



# resource "azurerm_network_interface" "nic_vm" {
#   for_each = var.nics

#   depends_on = [azurerm_subnet.subnet_vm]

#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   ip_configuration {
#     name                          = each.value.ip_configuration.name
#     subnet_id                     = azurerm_subnet.subnet_vm["subnet1"].id
#     private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
#   }
# }
# resource "azurerm_linux_virtual_machine" "vm_test" {
#   depends_on          = [azurerm_network_interface.nic_vm]
#   for_each            = var.vms
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   size                = each.value.size
#   admin_username      = each.value.admin_username

#   admin_password = each.value.admin_password

#   disable_password_authentication = each.value.disable_password_authentication
#   network_interface_ids = [
#     azurerm_network_interface.nic_vm["nic1"].id,
#   ]


#   os_disk {
#     caching              = each.value.os_disk.caching
#     storage_account_type = each.value.os_disk.storage_account_type
#   }

#   source_image_reference {
#     publisher = each.value.source_image_reference.publisher
#     offer     = each.value.source_image_reference.offer
#     sku       = each.value.source_image_reference.sku
#     version   = each.value.source_image_reference.version
#   }
# }