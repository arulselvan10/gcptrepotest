resource "azurerm_kubernetes_flux_configuration" "this" {
  name       = var.config_name
  cluster_id = var.cluster_id
  namespace  = var.operator_namespace
  scope      = var.scope

  git_repository {
    url                     = var.repository_url
    reference_type          = var.repository_branch_type
    reference_value         = var.repository_branch
    sync_interval_in_seconds = var.git_sync_interval
    timeout_in_seconds      = var.git_timeout
  }

  kustomizations {
    name                        = "apps"
    path                        = var.repository_path
    sync_interval_in_seconds    = var.sync_interval
    timeout_in_seconds          = var.timeout
    retry_interval_in_seconds   = var.retry_interval
    garbage_collection_enabled  = var.garbage_collection
    wait                        = var.wait
  }

  depends_on = var.depends_on
}
