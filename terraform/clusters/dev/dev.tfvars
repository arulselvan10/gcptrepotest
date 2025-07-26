config_name             = "gitops-dev"
cluster_name            = "aksflux001"
resource_group_name     = "fluxtest"
operator_namespace      = "flux-system"
repository_url          = "https://github.com/arulselvan10/gcptrepotest"
repository_branch       = "main"
git_sync_interval       = 60
git_timeout             = 600

repository_path         = "clusters/dev"
sync_interval           = 60
timeout                 = 300
retry_interval          = 120
garbage_collection      = true
wait                    = true
