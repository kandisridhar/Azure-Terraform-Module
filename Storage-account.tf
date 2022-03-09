resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access  = true
  tags = {
    environment = "test"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "storage_blob" {
  name  = var.Productapp
  storage_account_name  = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type = "Block"
  source = "C:/Users/sridhar/Desktop/Azure-task2/publish.rar"  
}