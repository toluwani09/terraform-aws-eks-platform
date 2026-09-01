#output for vpc module
output "vpc_id" {
  description = "The ID of the VPC created."
  value = aws_vpc.this.id
}   
output "public_subnet_ids" {
  description = "The IDs of the public subnets created."
  value       = aws_subnet.public.*.id
}
output "private_subnet_ids" {
  description = "The IDs of the private subnets created."
  value       = aws_subnet.private.*.id
}
output "nat_gateway_id" {
  description = "The ID of the NAT gateway created."
  value       = aws_nat_gateway.this.id
}
output "internet_gateway_id" {
  description = "The ID of the Internet gateway created."
  value       = aws_internet_gateway.this.id
}
output "public_route_table_id" {
  description = "The ID of the public route table created."
  value       = aws_route_table.public.id
}
output "private_route_table_id" {
  description = "The ID of the private route table created."
  value       = aws_route_table.private.id
}
output "aws_region" {
  description = "The AWS region where the resources are created."
  value       = var.aws_region
}
output "environment" {
  description = "The environment name for resource tagging."
  value       = var.environment
}
output "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  value       = var.vpc_cidr_block
}
output "vpc_availability_zones" {
  description = "The availability zones for the VPC."
  value       = var.vpc_availability_zones
}
output "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets."
  value       = var.public_subnet_cidrs
}
output "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets."
  value       = var.private_subnet_cidrs
}
output "public_subnet_azs" {
  description = "The availability zones for the public subnets."
  value       = aws_subnet.public.*.availability_zone
}
output "private_subnet_azs" {
  description = "The availability zones for the private subnets."
  value       = aws_subnet.private.*.availability_zone
}