#variables file for eks module including environment name, cluster name, kubernetes version, vpc id, private subnet ids, cluster role arn, node role arn, node instance type, desired nodes, minimum instance and max instances
variable "environment" {
  description = "Environment name"
  type        = string
}
variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}
variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
  type        = string
}
variable "private_subnet_ids" {
  description = "The IDs of the private subnets where the EKS cluster will be created."
  type        = list(string)
}
variable "cluster_role_arn" {
  description = "The ARN of the IAM role to use for the EKS cluster."
  type        = string
}
variable "node_role_arn" {
  description = "The ARN of the IAM role to use for the EKS worker nodes."
  type        = string
}
variable "node_instance_type" {
  description = "The instance type to use for the EKS worker nodes."
  type        = string
}
variable "desired_nodes" {
  description = "The desired number of worker nodes for the EKS cluster."
  type        = number
}
variable "min_nodes" {
  description = "The minimum number of worker nodes for the EKS cluster."
  type        = number
}   
variable "max_nodes" {
  description = "The maximum number of worker nodes for the EKS cluster."
  type        = number
}   
