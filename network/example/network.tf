module "network" {
  source = "../"

  vpc_cidr             = "172.20.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true

  azs_names       = data.aws_availability_zones.azs.names
  private_subnets = [{ name = "app", cidrs = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"] }, { name = "db", cidrs = ["172.20.7.0/24", "172.20.8.0/24", "172.20.9.0/24"] }]
  public_subnets  = [{ name = "web", cidrs = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"] }, { name = "jenkins", cidrs = ["172.20.10.0/24", "172.20.11.0/24", "172.20.12.0/24"] }]

  vpc_tags = {
    Name = "App-VPC"
  }
}