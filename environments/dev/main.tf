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
    Environment = "Dev"
    Project     = "Testing"
    Owner       = "Test"
    ManagedBy   = "Terraform"
  }
}

module "ec2_stack" {
  source    = "../../modules/ec2-stack"
  ec2_name  = "web"
  ami_names = "amazon-linux-ami-2"
  tags      = local.global_tags
}