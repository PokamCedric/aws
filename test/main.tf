module "network" {
  source = "../modules/network"

  vpc_cidr             = "10.10.10.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true

  azs_names = slice(data.aws_availability_zones.azs.names, 0, 3)

  public_subnets = [
    { name = "web",
    cidrs = ["10.10.10.0/27", "10.10.10.32/27", "10.10.10.64/27"] }
  ]

  vpc_tags = {
    Name = "App-VPC"
  }
}

module "security_group" {
  source = "../modules/sg"

  vpc_id = module.network.vpc_id
  name   = "security-group"
  ports  = [22, 80, 443, 8080]
  tags = {
    Name = "sg"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "auto_scaling_group" {
  source         = "../modules/asg"
  vpc_id         = module.network.vpc_id
  sg_ids         = [module.security_group.id]
  ami_id         = data.aws_ami.ubuntu.id
  subnet_ids     = module.network.public_subnet_ids
  user_data_path = "install-nginx.sh"

}