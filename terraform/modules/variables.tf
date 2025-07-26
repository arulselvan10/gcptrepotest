variable "config_name" {}
variable "cluster_name" {}
variable "resource_group_name" {}
variable "operator_namespace" {
  default = "flux-system"
}
variable "repository_url" {}
variable "repository_branch" {
  default = "main"
}
variable "repository_path" {}
variable "sync_interval" {
  default = 60
}
variable "timeout" {
  default = 600
}
