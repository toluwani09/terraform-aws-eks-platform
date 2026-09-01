#backend configuration for dev environment to connect to s3 bucket for state management in bootstrap module with bucket name eks-platform-terraform-state-2026
terraform {
  backend "s3" {
    bucket         = "eks-platform-terraform-state-2026"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-platform-terraform-state-lock"
  }
}