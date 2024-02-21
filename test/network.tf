module "network" {
  source = "../modules/network"

  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  azs_names       = slice(data.aws_availability_zones.azs.names, 0, 2)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  vpc_tags = {
    Name = "Dev-VPC"
  }
}
