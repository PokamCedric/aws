# Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "webserver-key" {
  key_name   = "webserver-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

module "network" {
  source = "../../network"

  azs_count       = var.azs_count
  vpc_cidr        = "172.20.0.0/20"
  azs_names       = slice(data.aws_availability_zones.azs.names, 0, var.azs_count)
  private_subnets = [{ name = "app", cidrs = ["172.20.3.0/24", "172.20.4.0/24"] }]
  vpc_tags = {
    Name = "Dev-VPC"
  }
}

module "sns" {
  source = "../../sns"

  name     = "dev-sns-topic"
  protocol = "email"
  endpoint = "aa@bb.fr"
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

module "asg" {
  source = "../"

  depends_on = [module.network, module.security_group, module.sns]
  # Launch template setup
  ami_id   = "ami-ami-07761f3ae34c4478d" # Amazon Linux 2
  key_name = aws_key_pair.webserver-key.key_name

  network = {
    associate_public_ip_address = true
    security_group_ids          = [module.security_group.id]

  }

  # Auto scaling group setup
  subnet_ids = module.network.private_subnet_ids
  capacity = {
    desired_capacity = 2
    min_size         = 1
    max_size         = 2
  }

  # Auto scaling group notification setup
  topic = {
    enabled = true
    arn     = module.sns.topic_arn
  }

}