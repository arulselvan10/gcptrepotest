data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "github_pat" {
  count        = var.use_key_vault ? 1 : 0
  name         = var.github_pat_secret_name
  key_vault_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-gitops/providers/Microsoft.KeyVault/vaults/${var.key_vault_name}"
}

locals {
  pat_value = var.use_key_vault ? data.azurerm_key_vault_secret.github_pat[0].value : var.github_pat
}

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
  git_repository_token         = local.pat_value
  sync_interval_in_seconds     = 60
}
