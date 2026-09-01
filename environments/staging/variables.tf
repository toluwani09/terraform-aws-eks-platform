#variables for staging environment including resources from bootstrap and vpc modules
variable "aws_region" {
    description = "The AWS region where the resources will be created."
    type        = string
    }
variable "environment" {
    description = "The environment name for resource tagging."
    type        = string
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
variable "kubernetes_version" {
    description = "The version of Kubernetes to use for the EKS cluster."
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
