# VPC Module

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  aws_region  = var.aws_region
  vpc_cidr_block        = var.vpc_cidr_block
  vpc_availability_zones = var.vpc_availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

# IAM Module

module "iam" {
  source = "../../modules/iam"

  environment = var.environment
}

# EKS Module
module "eks" {
  source = "../../modules/eks"

  environment        = var.environment
  cluster_name       = "${var.environment}-eks-cluster"
  kubernetes_version = var.kubernetes_version

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  node_instance_type = var.node_instance_type
  desired_nodes      = var.desired_nodes
  min_nodes          = var.min_nodes
  max_nodes          = var.max_nodes
}