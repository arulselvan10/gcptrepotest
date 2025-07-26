resource "azurerm_kubernetes_flux_configuration" "this" {
  name        = var.config_name
  cluster_id  = var.cluster_id
  namespace   = var.operator_namespace
  scope       = "cluster"
  source_kind = "GitRepository"
  suspend     = false

  git_repository {
    url            = var.repository_url
    reference_type = "branch"
    reference_name = var.repository_branch
  }

  kustomizations {
    name     = "apps"
    path     = var.repository_path
    prune    = true
    interval = "${var.sync_interval}s"
    timeout  = "${var.timeout}s"
  }
}
