module "network" {
  source = "../../network"

  vpc_cidr             = "172.20.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true

  azs_names       = slice(data.aws_availability_zones.azs.names, 0, 2)

  private_subnets = [{ name = "db", cidrs = ["172.20.7.0/24", "172.20.8.0/24", "172.20.9.0/24"] }]

  vpc_tags = {
    Name = "App-VPC"
  }
}

output "azs_names" {
  value = module.network.azs_names
}

module "rds" {
    source = "../"
  
  subnet_ids = module.network.private_subnet
}