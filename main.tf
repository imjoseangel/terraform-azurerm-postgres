#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp[*].name, azurerm_resource_group.rg[*].name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp[*].location, azurerm_resource_group.rg[*].location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

# Randon password for Login Admin
#------------------------------------
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

#---------------------------------------------------------
# Postgres Creation or selection
#---------------------------------------------------------

resource "azurerm_postgresql_server" "main" {
  #ts:skip=accurics.azure.BDR.163 PGSQL should be skipped for now.
  name                             = var.name
  location                         = local.location
  resource_group_name              = local.resource_group_name
  sku_name                         = var.sku_name
  version                          = var.psql_version
  administrator_login              = var.administrator_login
  administrator_login_password     = random_password.password.result
  geo_redundant_backup_enabled     = var.geo_redundant_backup_enabled
  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  storage_mb                       = var.storage_mb
  tags                             = merge({ "ResourceName" = format("%s", var.name) }, var.tags, )
}
