#variables for VPC module including aws_region, environment, vpc_cidr_block, public_subnet_cidrs, private_subnet_cidrs, and availability_zones
variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}   
variable "environment" {
  description = "The environment name for resource tagging."
  type        = string
  default     = "dev"
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}
variable "vpc_availability_zones" {
  description = "The availability zones for the VPC."
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
}
