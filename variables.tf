variable "name" {
  description = "Name of Azure Postgres service."
}

variable "create_resource_group" {
  description = "Whether to create resource group"
  default     = true
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-demo-westeurope-01"
}

variable "location" {
  description = "The location/region to keep all resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
}

variable "administrator_login" {
  description = "The administrator login name for the Postgres server."
  type        = string
  default     = "postgres"
}

variable "sku_name" {
  description = "(Required) Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)"
  type        = string
  default     = "GP_Gen5_8"
}

variable "version" {
  description = "(Required) Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, 10, 10.0, and 11. Changing this forces a new resource to be created."
  type        = string
  default     = "11"
}
