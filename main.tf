provider "aws" {
  region = var.aws_region
}

module "application_infrastructure" {
  source = "git::https://github.com/romagalhaes/infra-modules.git//aws/app-base?ref=v1.0.0"

  app_name    = var.app_name
  environment = var.environment

  tags = {
    ManagedBy  = "Backstage-IDP"
    Owner      = "group:default/guests"
    Project    = var.app_name
    CostCenter = "Engineering"
  }
}

output "app_endpoint" {
  value       = module.application_infrastructure.endpoint
  description = "URL de acesso à aplicação"
}
