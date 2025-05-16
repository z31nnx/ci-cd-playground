terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

locals {
  global_tags = {
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
    ManagedBy   = var.managedby
  }
}

module "ec2_stack" {
  source    = "../../modules/ec2-stack"
  ec2_name  = var.ec2_name
  ami_names = var.ami_name
  tags      = local.global_tags
}