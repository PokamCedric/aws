
module "asg" {
  source = "../modules/asg"

  depends_on = [module.network, module.web_security_group]
  # Launch template setup
  ami_id   = var.ami
  key_name = aws_key_pair.webserver_key.key_name

  network = {
    associate_public_ip_address = true
    security_group_ids          = [module.web_security_group.id]

  }

  target_group_arns = [module.alb.lb_target_group_arn]
  # Auto scaling group setup
  subnet_ids = module.network.private_subnet_ids
  capacity = {
    desired_capacity = 2
    min_size         = 1
    max_size         = 2
  }
}