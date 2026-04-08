terraform {
  backend "s3" {
    bucket       = "arquitetura-iac-tfstate-global"
    key          = "environments/dev/resources/service/dev-repo-infra/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
