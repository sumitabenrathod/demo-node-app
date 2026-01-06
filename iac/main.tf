terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

########################
# VPC
########################
module "vpc" {
  source = "git::https://github.com/sumitabenrathod/terraform-aws-modules-custom.git"
  
  name            = "dev-vpc"
  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# module "ecr" {
#   source = "../../modules/ecr"
#   name   = "node-app"
# }

# module "eks" {
#   source = "../../modules/eks"

#   cluster_name = "prod-eks"
#   vpc_id       = module.vpc.vpc_id
#   subnet_ids   = module.vpc.private_subnets
# }

# module "iam" {
#   source = "../../modules/iam"
# }

