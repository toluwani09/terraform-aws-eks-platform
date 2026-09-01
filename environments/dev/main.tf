#main terraform file for dev environment including values from bootstrap module and eks module, iam module, vpc module
#vpc module
module "vpc" {
  source                 = "../../modules/vpc"
  environment            = var.environment
  aws_region             = var.aws_region
  vpc_cidr_block         = var.vpc_cidr_block
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  vpc_availability_zones = var.vpc_availability_zones
}
#IAM module
module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}
#eks module
module "eks" {
  source             = "../../modules/eks"
  cluster_name       = "${var.environment}-eks-cluster"
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  kubernetes_version = var.kubernetes_version
  node_instance_type = var.node_instance_type
  desired_nodes      = var.desired_nodes
  min_nodes          = var.min_nodes
  max_nodes          = var.max_nodes
}
