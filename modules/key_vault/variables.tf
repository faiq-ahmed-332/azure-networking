variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "app_subnet_id" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "location_short" {
  type    = string
  default = "uks"
}
