#output for terraform-aws-eks-platform/environments/dev/outputs.tf
#vpc outputs
output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}
#public subnet outputs
output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}
#private subnet outputs
output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = module.vpc.private_subnet_ids
}
#EKS cluster outputs
output "eks_cluster_id" {
  description = "The ID of the EKS cluster."
  value       = module.eks.eks_cluster_id
}
output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.eks_cluster_name
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

#IAM role outputs
output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role associated with the EKS cluster."
  value       = module.iam.eks_cluster_role_arn
}
output "eks_node_role_arn" {
  description = "The ARN of the IAM role associated with the EKS node group."
  value       = module.iam.eks_node_role_arn
}   