terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.75.0"
    }
  }
}
provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}

module "gitops_flux" {
  source = "../../modules"

  config_name          = var.config_name
  cluster_id           = data.azurerm_kubernetes_cluster.aks.id
  operator_namespace   = var.operator_namespace
  repository_url       = var.repository_url
  repository_branch    = var.repository_branch
  repository_path      = var.repository_path
  sync_interval        = var.sync_interval
  timeout              = var.timeout
}
