#outputs for production environment


output "vpc_id" {
  description = "The ID of the VPC created for the EKS cluster."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC created for the EKS cluster."
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets created for the EKS cluster."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets created for the EKS cluster."
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_id" {
  description = "The ID of the EKS cluster."
  value       = module.eks.eks_cluster_id
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.eks_cluster_name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = module.eks.eks_cluster_arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "The security group ID of the EKS cluster."
  value       = module.eks.eks_cluster_security_group_id
}

output "eks_cluster_certificate_authority_data" {
  description = "The certificate authority data of the EKS cluster."
  value       = module.eks.eks_cluster_certificate_authority_data
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster."
  value       = module.eks.eks_cluster_version
}

output "eks_node_group_name" {
  description = "The name of the EKS node group."
  value       = module.eks.eks_node_group_name
}

output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role associated with the EKS cluster."
  value       = module.iam.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "The ARN of the IAM role associated with the EKS node group."
  value       = module.iam.eks_node_role_arn
}