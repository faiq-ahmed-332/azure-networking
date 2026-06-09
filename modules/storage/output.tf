output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "private_endpoint_ip" {
  description = "Private IP of the storage endpoint inside the VNet"
  value       = azurerm_private_endpoint.storage.private_service_connection[0].private_ip_address
}