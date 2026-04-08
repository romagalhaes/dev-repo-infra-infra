# dev-repo-infra Infra

Repositorio da aplicacao dev-repo-infra

## Visao Geral

Este repositorio contem a infraestrutura da aplicacao `dev-repo-infra`.
Os recursos sao gerenciados com Terraform e executados via GitHub Actions.

## Estrutura

- `backend.tf`: configuracao do backend remoto do Terraform
- `main.tf`: chamada do modulo principal de infraestrutura
- `variables.tf`: variaveis base do projeto
- `.github/workflows/terraform.yml`: pipeline de validate, apply e destroy

## Operacao

- Pull requests para `main` executam validacoes locais do Terraform sem acessar a AWS
- Push em `main` executa `terraform apply`
- A exclusao do servico dispara `terraform destroy` antes da remocao dos repositorios

## Seguranca

- A autenticacao com a AWS e feita via OIDC
- O workflow assume a role `arn:aws:iam::889662756003:role/idp-backstage`
- O estado remoto do Terraform fica armazenado no bucket `arquitetura-iac-tfstate-global`
- O state deste repositorio usa a chave `environments/dev/resources/service/dev-repo-infra/terraform.tfstate`
- Se este repositorio ja possuia state anterior, execute a migracao de backend antes do proximo apply

## Ownership

- Owner: `group:default/guests`
- Cloud provider: `aws`
- Region: `us-east-1`
- Repositorio da aplicacao: https://github.com/romagalhaes/dev-repo-infra
