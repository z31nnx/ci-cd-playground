locals {
  global_tags = var.tags
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

data "aws_availability_zones" "available" {
    state = "available"
}
