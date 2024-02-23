module "network" {
  source = "../modules/network"

  azs_count            = var.azs_count # This is required
  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  azs_names       = slice(data.aws_availability_zones.azs.names, 0, var.azs_count)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  vpc_tags = { Name = "Dev-VPC" }
  igw_tags = { Name = "Dev-IGW" }
}

locals {
  vpc_id = module.network.vpc_id
}
