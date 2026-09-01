#main terraform for eks module including eks cluster, eks managed node group
#eks cluster resource
resource "aws_eks_cluster" "this" {
  name     = "${var.environment}-eks-cluster"
  role_arn = var.cluster_role_arn

  vpc_config {
   subnet_ids = var.private_subnet_ids
  }

  tags = {
    Name        = "${var.environment}-eks-cluster"
    Environment = var.environment
  }
}
#eks managed node group resource
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.environment}-eks-node-group"
  node_role_arn = var.node_role_arn
 subnet_ids = var.private_subnet_ids

  scaling_config {
    desired_size = var.desired_nodes
    max_size     = var.max_nodes
    min_size     = var.min_nodes
  }

  instance_types = [var.node_instance_type]

  tags = {
    Name        = "${var.environment}-eks-node-group"
    Environment = var.environment
  }
}   