#outputs for staging environment
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
#EKS cluster outputs including cluster name, cluster endpoints, cluster security group name and node group name 
output "eks_cluster_name" { 
    description = "The name of the EKS cluster."
    value       = module.eks.cluster_name
}
output "eks_cluster_endpoint" {
  description = "Endpoint of the Staging EKS Cluster."
  value = module.eks.eks_cluster_endpoint
}
output "eks_cluster_security_group_id" {
  description = "Security group ID created by EKS"
  value       = module.eks.cluster_security_group_id
}

output "eks_node_group_name" {
  description = "Name of the Staging EKS node group"
  value       = module.eks.node_group_name
}

#IAM Outputs
output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = module.iam.eks_cluster_role_arn
}
output "eks_node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = module.iam.eks_node_role_arn
}