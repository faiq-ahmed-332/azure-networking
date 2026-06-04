env                 = "dev"
location            = "uksouth"
location_short      = "uks"
resource_group_name = "rg-clearbank-dev-uks"
vnet_cidr           = "10.0.0.0/16"
app_subnet_cidr     = "10.0.1.0/24"
data_subnet_cidr    = "10.0.2.0/24"
tags = {
  environment = "dev"
  managed_by  = "terraform"
}
subscription_id = "529f011b-a8a7-45a0-981d-f1a177731f94"
tenant_id       = "91bcb1a1-04b1-407a-bc20-dbc3e30409ee"
