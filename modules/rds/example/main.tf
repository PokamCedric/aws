module "network" {
  source = "../../network"

  azs_count       = var.azs_count
  vpc_cidr        = "172.20.0.0/20"
  azs_names       = slice(data.aws_availability_zones.azs.names, 0, var.azs_count)
  private_subnets = [{ name = "db", cidrs = ["172.20.7.0/24", "172.20.8.0/24"] }]
  vpc_tags = {
    Name = "Dev-VPC"
  }
}

module "security_group" {
    source = "../../security-group"
  

  name        = "db-sg"
  description = "Security Group for the Database Server"
  vpc_id      = module.network.vpc_id
  ports       = [{ id = 3306, source = ["0.0.0.0/0"] }]
}

output "azs_names" {
  value = module.network.azs_names
}

module "rds" {
  source = "../"
  
  subnet_ids = module.network.private_subnet_ids
  security_group_ids = [module.security_group.id]
  availability_zone = module.network.azs_names[0]
  instance_identifier = "dev-rds-instance"
}