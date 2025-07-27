variable "clusters" {
  type = list(object({
    name            = string
    resource_group  = string
    subscription_id = string
  }))
}

variable "gitops_repo_url" { type = string }
