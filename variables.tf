#resource_group
variable "resource_group_name" {
    type = string
    description = "resource_group_name"
}

variable "location" {
    type = string
    description = "location"
}

variable "nsg" {
    type = string
    description = "nsg_name"
}

variable "vnet" {
    type = string
    description = "vnet name"
}

variable "subnet" {
    type = string
    description = "subnet name"
}
