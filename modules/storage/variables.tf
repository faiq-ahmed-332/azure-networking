variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "location_short" { type = string }
variable "env" { type = string }
variable "subnet_id" { type = string } # data subnet from networking module
variable "vnet_id" { type = string }   # vnet from networking module
variable "tags" { type = map(string) }