variable "app_name" {
  type        = string
  description = "Nome da aplicação"
  default     = "dev-repo-infra"
}

variable "cloud_provider" {
  type    = string
  default = "aws"
}

variable "aws_region" {
  type        = string
  description = "Regiao AWS usada pelo provider e backend remoto"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Ambiente da aplicação"
  default     = "dev"
}
