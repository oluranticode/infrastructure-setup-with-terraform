variable "environment" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "us-east-1-temzy-cluster-dev"
}

variable "auto_scaling_enabled" {
  type    = bool
  default = true
}

