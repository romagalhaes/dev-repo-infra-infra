terraform {
  backend "s3" {
    bucket         = "empresa-terraform-state"
    # O path será único para este novo projeto
    key            = "projects/dev-repo-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}