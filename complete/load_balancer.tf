
module "alb" {
  source = "../modules/load-balancer"

  # Setup Load Balancer
  security_group_ids = [module.alb_security_group.id]
  subnet_ids         = module.network.public_subnet_ids # At least one public subnet in each AZ

  # Setup Target Group
  vpc_id = local.vpc_id
  // target_instances = [for i in module.webserver[*] : { id = i.id, port = 80 }]

  # Set listeners
  alb_fa_listener_count = 1
  ra_listener_count     = 1
  certificate_arn       = module.acm.certificate_arn

}

