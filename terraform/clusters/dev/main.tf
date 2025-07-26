provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}

module "gitops" {
  source = "../../modules"

  config_name            = var.config_name
  cluster_id             = data.azurerm_kubernetes_cluster.aks.id
  operator_namespace     = var.operator_namespace
  scope                  = "cluster"

  repository_url         = var.repository_url
  repository_branch_type = var.repository_branch_type
  repository_branch      = var.repository_branch
  git_sync_interval      = var.git_sync_interval
  git_timeout            = var.git_timeout

  repository_path        = var.repository_path
  sync_interval          = var.sync_interval
  timeout                = var.timeout
  retry_interval         = var.retry_interval
  garbage_collection     = var.garbage_collection
  wait                    = var.wait

  depends_on = [
    azurerm_kubernetes_cluster.aks   # or any other resource the GitOps config depends on
  ]
}

