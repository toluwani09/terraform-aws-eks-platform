#outputs for eks module
#eks cluster outputs including cluster name, cluster id,,cluster arn, cluster endpoint, cluster security group id, cluster certificate authority data, cluster version, cluster role arn, node group name, node group arn, node group status, node group instance types, node group scaling config, node group subnets
output "eks_cluster_id" {
  description = "The ID of the EKS cluster."
  value       = aws_eks_cluster.this.id
}
output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.this.name
}
output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = aws_eks_cluster.this.arn
}
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = aws_eks_cluster.this.endpoint
}
output "eks_cluster_security_group_id" {
  description = "The security group ID of the EKS cluster."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}
output "eks_cluster_certificate_authority_data" {
  description = "The certificate authority data of the EKS cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}
output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster."
  value       = aws_eks_cluster.this.version
}
output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role associated with the EKS cluster."
  value       = aws_eks_cluster.this.role_arn
}
output "eks_node_group_name" {
  description = "The name of the EKS node group."
  value       = aws_eks_node_group.this.node_group_name
}
output "eks_node_group_arn" {
  description = "The ARN of the EKS node group."
  value       = aws_eks_node_group.this.arn
}
output "eks_node_group_status" {
  description = "The status of the EKS node group."
  value       = aws_eks_node_group.this.status
}
output "eks_node_group_instance_types" {
  description = "The instance types of the EKS node group."
  value       = aws_eks_node_group.this.instance_types
}
output "eks_node_group_scaling_config" {
  description = "The scaling configuration of the EKS node group."
  value       = aws_eks_node_group.this.scaling_config
}
output "eks_node_group_subnets" {
  description = "The subnets of the EKS node group."
  value       = aws_eks_node_group.this.subnet_ids
}
