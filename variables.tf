variable "env" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for resource deployment (e.g. uksouth, eastus)"
  type        = string
}

variable "location_short" {
  description = "Short abbreviation of Azure region used in resource naming (e.g. uks, eus)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group to deploy resources into"
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
  description = "Map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "Azure Subscription ID to deploy resources into"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID to deploy resources into"
  type        = string
  sensitive   = true
}

variable "app_name" {
  description = "Base name for resources (e.g. myapp)"
  type        = string
  default     = "clearbank"
}