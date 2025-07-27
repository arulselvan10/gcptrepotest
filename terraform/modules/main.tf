resource "azurerm_kubernetes_flux_configuration" "gitops" {
  for_each                     = { for cluster in var.clusters : cluster.name => cluster }
  name                         = "gitops-config"
  cluster_id                   = "/subscriptions/${each.value.subscription_id}/resourceGroups/${each.value.resource_group}/providers/Microsoft.Kubernetes/connectedClusters/${each.key}"
  namespace                    = "flux-system"
  scope                        = "cluster"
  source_kind                  = "GitRepository"
  git_repository_url           = var.gitops_repo_url
  git_repository_reference     = { branch = "main" }
  git_repository_auth_type     = "Token"
  git_repository_token         = test
  sync_interval_in_seconds     = 60
}
