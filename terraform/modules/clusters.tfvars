clusters = [
  {
    name            = "aksflux001"
    resource_group  = "Fluxtest"
    subscription_id = "adc154cb-3872-4de1-82e0-2d0219fb24b1"
  },
  {
    name            = "aksflux002"
    resource_group  = "Fluxtest"
    subscription_id = "adc154cb-3872-4de1-82e0-2d0219fb24b1"
  }
]

gitops_repo_url = "https://github.com/arulselvan10/gcprepotest"

# Option 1: PAT direct
github_pat = "ghp_yourPAT"
use_key_vault = false

# Option 2: Key Vault
# use_key_vault = true
# key_vault_name = "myGitOpsVault"
# github_pat_secret_name = "github-pat"
