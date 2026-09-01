#backend for state locking and remote state management for staging environment to connect to s3 bucket for state management in bootstrap module with bucket name eks-platform-terraform-state-2026
terraform {
  backend "s3" {
    bucket = "eks-platform-terraform-state-2026"
    key    = "staging/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "eks-platform-terraform-state-lock-2026"
  }
}
