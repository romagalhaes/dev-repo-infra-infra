variable "app_name" {
  type        = string
  description = "Nome da aplicação"
  default     = "dev-repo-infra"
}

variable "cloud_provider" {
  type    = string
  default = "aws"
}