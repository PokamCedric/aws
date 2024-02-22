
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
# }

# module "auto_scaling_group" {
#   source         = "../modules/asg"
#   vpc_id         = module.network.vpc_id
#   sg_ids         = [module.security_group.id]
#   ami_id         = data.aws_ami.ubuntu.id
#   subnet_ids     = module.network.public_subnet_ids
#   user_data_path = "install-nginx.sh"

# }