# variable "rgs" {
#   type = map(object({
#     name     = string
#     location = string
#   }))
# }
# variable "stgs" {
#   type = map(object({
#     name                     = string
#     resource_group_name      = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     }
#   ))
# }
# variable "vnets" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     address_space       = list(string)

#   }))
# }
# variable "subnets" {
#   type = map(object({
#     name                 = string
#     resource_group_name  = string
#     virtual_network_name = string
#     address_prefixes     = list(string)
#   }))
# }
# variable "pips" {
#   type = map(object({
#     name                = string
#     resource_group_name = string
#     location            = string
#     allocation_method   = string
#   }))
# }

# variable "nsgs" {

# }
# # variable "nsgs" {
# #     type = map(object({
# #          name                = string
# #   location            = string
# #   resource_group_name = string
# #     }
# #   security_rule {
# #     type = object({
# #     name                       = "test123"
# #     priority                   = 100
# #     direction                  = "Inbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = "*"
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }

# #   tags = {
# #     environment = "Production"
# #     }))
# # }
# variable "nics" {

# }
# variable "vms" {

# }
variable "rgs_pv" {

}

variable "stgs_pv" {

}

variable "vnets_pv" {

}

variable "vms_pv" {

}



variable "pips_pv" {

}

variable "nsgs_pv" {

}

variable "nics_pv" {

}