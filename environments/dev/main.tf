terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket       = "my-magical-test-backend-bucket-from-bug"
    key          = "environments/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
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
  source   = "../../modules/ec2-stack"
  ec2_name = var.ec2_name
  tags     = local.global_tags
}