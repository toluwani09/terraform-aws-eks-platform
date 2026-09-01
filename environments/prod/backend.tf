#backend configuration for production environment to connect to s3 bucket for state management
terraform {
  backend "s3" {
    bucket         = "eks-platform-terraform-state-2026"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-platform-terraform-state-lock-2026"
  }
}
