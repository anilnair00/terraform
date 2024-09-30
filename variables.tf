#resource_group
variable "resource_group_name" {
    type = string
    default = myvarrg
    description = "resource_group_name"
}

variable "location" {
    type = string
    default = myvarlocation
    description = "location"
}
