provider "azurerm" {
  features {}
}

module "gitops" {
  source = "../../modules"

  config_name          = var.config_name
  cluster_name         = var.cluster_name
  resource_group_name  = var.resource_group_name
  operator_namespace   = var.operator_namespace
  repository_url       = var.repository_url
  repository_branch    = var.repository_branch
  repository_path      = var.repository_path
  sync_interval        = var.sync_interval
  timeout              = var.timeout
}
