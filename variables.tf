variable "name" {
  description = "Name of Azure Postgres service."
  type        = string
}

variable "create_resource_group" {
  description = "Whether to create resource group"
  default     = true
  type        = bool
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-demo-westeurope-01"
  type        = string
}

variable "location" {
  description = "The location/region to keep all resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
  type        = string
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

variable "psql_version" {
  description = "(Required) Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, 10, 10.0, and 11. Changing this forces a new resource to be created."
  type        = string
  default     = "11"
}

variable "geo_redundant_backup_enabled" {
  description = "(Optional) Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not support for the Basic tier. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "(Optional) Enable/Disable public network access. If enabled, the server is accessible from the Internet. The default value if not explicitly specified is false."
  type        = bool
  default     = false
}

variable "storage_mb" {
  description = "(Optional) Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 16777216 MB(16TB) for General Purpose/Memory Optimized SKUs"
  type        = string
  default     = "5120"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
