#variables for bootstrap module
variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}
variable "environment" {
  description = "The environment name for resource tagging."
  type        = string
  default     = "bootstrap"
}
