variable "clusters" {
  type = list(object({
    name            = string
    resource_group  = string
    subscription_id = string
  }))
}

variable "gitops_repo_url" { type = string }
variable "github_pat" { type = string, sensitive = true }
variable "use_key_vault" { type = bool, default = false }
variable "key_vault_name" { type = string, default = "" }
variable "github_pat_secret_name" { type = string, default = "" }
