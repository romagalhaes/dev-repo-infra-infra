# Configuração do Provider (Exemplo AWS, adapte para GCP/Azure conforme o cloud_provider)
provider "aws" {
  region = "us-east-1"
}

# Chamada do Módulo de Aplicação Padrão
module "application_infrastructure" {
  # Aponta para o seu repositório central de módulos que definimos no início
  source = "git::https://github.com/romagalhaes/infra-modules.git//aws/app-base?ref=v1.0.0"

  app_name        = "dev-repo-infra"
  environment     = "dev"
  
  # Tags obrigatórias para governança e custos
  tags = {
    ManagedBy   = "Backstage-IDP"
    Owner       = "group:default/guests"
    Project     = "dev-repo-infra"
    CostCenter  = "Engineering"
  }
}

# Exemplo de saída para o desenvolvedor ver no log do CI/CD
output "app_endpoint" {
  value       = module.application_infrastructure.endpoint
  description = "URL de acesso à aplicação"
}