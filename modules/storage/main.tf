# 1. Storage Account — the main resource
resource "azurerm_storage_account" "this" {
  name                     = "st${var.env}${var.location_short}001"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags

  # Security hardening
  https_traffic_only_enabled    = true
  min_tls_version               = "TLS1_2"
  shared_access_key_enabled     = false
  public_network_access_enabled = false # no public internet access

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}

# 2. Private DNS Zone — resolves storage privately inside the VNet
resource "azurerm_private_dns_zone" "storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# 3. Link DNS Zone to the VNet
resource "azurerm_private_dns_zone_virtual_network_link" "storage" {
  name                  = "dns-link-storage-${var.env}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
  tags                  = var.tags
}

# 4. Private Endpoint — puts a private NIC inside the data subnet
resource "azurerm_private_endpoint" "storage" {
  name                = "pe-storage-${var.env}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "psc-storage"
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns-zone-group-storage"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage.id]
  }
}