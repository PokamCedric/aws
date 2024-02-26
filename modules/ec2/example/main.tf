module "iam_bucket_role_policy" {
  source = "../../iam"

  instance_profile = "fleetcart_web_ip"
  role             = var.role
  policy           = var.policy

}


# Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "webserver-key" {
  key_name   = "webserver-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

module "network" {
  source = "../../network"

  azs_count      = var.azs_count
  vpc_cidr       = "172.20.0.0/20"
  azs_names      = slice(data.aws_availability_zones.azs.names, 0, var.azs_count)
  public_subnets = [{ name = "app", cidrs = ["172.20.3.0/24", "172.20.4.0/24"] }]
  vpc_tags = {
    Name = "Dev-VPC"
  }
}

locals {
  vpc_id = module.network.vpc_id
}

module "security_group" {
  source = "../../security-group"

  name        = "Webserver-sg"
  description = "Security Group for the Web Server"
  vpc_id      = local.vpc_id
  ports = [
    { id = 80, source = ["0.0.0.0/0"] },
    { id = 443, source = ["0.0.0.0/0"] },
    { id = 22, source = ["0.0.0.0/0"] }
  ]
}

module "instance" {
  source = "../"

  ami_id               = "ami-0e731c8a588258d0d"
  instance_type        = "t2.micro"
  iam_instance_profile = module.iam_bucket_role_policy.instance_profile_name
  key_name             = aws_key_pair.webserver-key.key_name
  security_group_ids   = [module.security_group.id]
  user_data_path       = templatefile("./install_jenkins.sh", {})

  tags = {
    Name = "webserver"
  }

  volume_size = 8

}