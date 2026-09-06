output "resource_group_name" {
  value = azurerm_resource_group.this.name
  description = "The name of the Resource Group. Every other module consumes this."

}

output "resource_group_id" {
  value = azurerm_resource_group.this.id
  description = "The resource ID of the Resource Group."
}

output "location" {
  value = azurerm_resource_group.this.location
  description = "The Azure region the Resource Group was created in"
}