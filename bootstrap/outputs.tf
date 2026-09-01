#outputs for bootstrap module
output "aws_region" {
  description = "The AWS region where the resources are created."
  value       = var.aws_region
}

output "environment" {
  description = "The environment name for resource tagging."
  value       = var.environment
}
output "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform remote state."
  value       = aws_s3_bucket.terraform_state.bucket
}
output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for Terraform remote state."
  value       = aws_s3_bucket.terraform_state.arn
}
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking."
  value       = aws_dynamodb_table.terraform_state_lock.name
}
output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table for Terraform state locking."
  value       = aws_dynamodb_table.terraform_state_lock.arn
}

