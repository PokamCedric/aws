# This ec2 image is just for creating to operate the setup and finally create an AMI of the website
module "instance" {
  source = "../modules/ec2"

  ami_id               = "ami-07761f3ae34c4478d" # Amazon Linux instance 2 (Please dont use 2023 or more recent)"
  instance_type        = "t2.micro"
  iam_instance_profile = module.iam_bucket_role_policy.instance_profile
  subnet_id            = module.network.public_subnet_ids[0]
  key_name             = aws_key_pair.webserver-key.key_name
  security_group_ids = [
    module.alb_security_group.id,
    module.bh_security_group.id,
    module.web_security_group.id
  ]
  user_data_path = "./install-apache.sh" # I recommend to do these steps manually (not over user data)

  tags = {
    Name = "webserver-setup"
  }

  volume_size = 8

}