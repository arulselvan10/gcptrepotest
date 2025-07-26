variable "config_name" {
  description = "The name of the Flux configuration"
  type        = string
}

variable "cluster_id" {
  description = "The ARM resource ID of the AKS cluster"
  type        = string
}

variable "operator_namespace" {
  description = "Namespace where Flux will be installed"
  type        = string
  default     = "flux-system"
}

variable "repository_url" {
  description = "Git repository URL"
  type        = string
}

variable "repository_branch" {
  description = "Git branch"
  type        = string
  default     = "main"
}

variable "repository_path" {
  description = "Path in repo to the kustomization.yaml"
  type        = string
}

variable "sync_interval" {
  description = "Sync interval in seconds"
  type        = number
  default     = 60
}

variable "timeout" {
  description = "Sync timeout in seconds"
  type        = number
  default     = 600
}
