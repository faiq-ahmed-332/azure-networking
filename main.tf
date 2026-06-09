resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source = "./modules/networking"

  env                 = var.env
  location            = azurerm_resource_group.main.location
  location_short      = var.location_short
  resource_group_name = azurerm_resource_group.main.name
  vnet_cidr           = var.vnet_cidr
  app_subnet_cidr     = var.app_subnet_cidr
  data_subnet_cidr    = var.data_subnet_cidr
  tags                = var.tags
}

module "key_vault" {
  source = "./modules/key_vault"

  name                = "kv-${var.app_name}-${var.env}-${var.location_short}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  tenant_id           = var.tenant_id
  app_subnet_id       = module.networking.app_subnet_id
  vnet_id             = module.networking.vnet_id
  tags                = var.tags
}