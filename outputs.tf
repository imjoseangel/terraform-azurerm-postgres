output "id" {
  description = "The ID of the PostgreSQL Server."
  value       = azurerm_postgresql_server.main.id
}

output "fqdn" {
  description = "The FQDN of the PostgreSQL Server."
  value       = azurerm_postgresql_server.main.fqdn
}

output "identity" {
  description = "An identity block as documented below."
  value       = azurerm_postgresql_server.main.identity
}
