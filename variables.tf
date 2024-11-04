#resource_group
variable "resource_group_name" {
    type = string
    description = "resource_group_name"
}

variable "location" {
    type = string
    description = "location"
}

variable "nsg_name" {
    type = string
    description = "nsg_name"
}

variable "vnet_name" {
    type = string
    description = "vnet name"
}

variable "subnet_name" {
    type = string
    description = "subnet name"
}
