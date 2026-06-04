variable "env" {
  description = "The environment for which to create the virtual network (e.g., dev, staging, prod)."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the virtual network."
  type        = string
  default     = "uksouth"
}

variable "location_short" {
  description = "A short name for the Azure region (e.g., uk, us, eu)."
  type        = string
  default     = "uks"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}


variable "vnet_cidr" {
  description = "CIDR block for the virtual network (e.g. 10.0.0.0/16)"
  type        = string
}

variable "app_subnet_cidr" {
  description = "CIDR block for the application subnet (e.g. 10.0.1.0/24)"
  type        = string
}

variable "data_subnet_cidr" {
  description = "CIDR block for the data subnet (e.g. 10.0.2.0/24)"
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the virtual network."
  type        = map(string)
  default     = {}
}




