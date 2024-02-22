module "network" {
  source = "../../network"

  azs_count      = var.azs_count
  vpc_cidr       = "172.20.0.0/20"
  azs_names      = slice(data.aws_availability_zones.azs.names, 0, var.azs_count)
  public_subnets = [{ name = "elb", cidrs = ["172.20.0.0/24", "172.20.1.0/24"] }]
  vpc_tags = {
    Name = "Dev-VPC"
  }
}

locals {
  vpc_id = module.network.vpc_id
}

# Security Group for the Application Load Balancer
module "alb_security_group" {
  source = "../../security-group"

  name        = "alb-sg"
  description = "Security Group for the Application Load Balancer"
  vpc_id      = local.vpc_id
  ports = [
    { id = 80, source = ["0.0.0.0/0"] },
    { id = 443, source = ["0.0.0.0/0"] }
  ]
}

module "alb" {
  source = "../"

  # Setup Load Balancer
  security_group_ids = [module.alb_security_group.id]
  subnet_ids         = module.network.public_subnet_ids

  # Setup Target Group
  vpc_id = local.vpc_id

  # Set listeners
  alb_fa_listener_count = 1
  ra_listener_count     = 1
  # certificate_arn       =  # Add your certificate arn here

}