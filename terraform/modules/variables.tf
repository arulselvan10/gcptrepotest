variable "config_name" { type = string }
variable "cluster_id" { type = string }
variable "operator_namespace" { type = string }
variable "scope" { type = string }                 # e.g. "cluster"

variable "repository_url" { type = string }
variable "repository_branch_type" { type = string } # branch, tag, commit
variable "repository_branch" { type = string }

variable "git_sync_interval" { type = number }
variable "git_timeout" { type = number }

variable "repository_path" { type = string }

variable "sync_interval" { type = number }
variable "timeout" { type = number }
variable "retry_interval" { type = number }
variable "garbage_collection" { type = bool }
variable "wait" { type = bool }
