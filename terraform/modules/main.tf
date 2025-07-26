resource "azurerm_kubernetes_cluster_gitops_config" "flux" {
  name                    = var.config_name
  cluster_name            = var.cluster_name
  resource_group_name     = var.resource_group_name
  operator_namespace      = var.operator_namespace
  operator_instance_name  = "flux"
  repository_url          = var.repository_url
  repository_reference_type  = "branch"
  repository_reference_value = var.repository_branch
  operator_params         = "--git-readonly=true --git-poll-interval=1m"

  kustomization {
    name                        = "apps"
    path                        = var.repository_path
    sync_interval_in_seconds    = var.sync_interval
    timeout_in_seconds          = var.timeout
    prune                       = true
  }
}
