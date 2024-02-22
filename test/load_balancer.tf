
module "alb" {
  source = "../modules/load-balancer"

  # Setup Load Balancer
  security_group_ids = [alb_security_group.id]
  subnet_ids         = module.network.public_subnet_ids

  # Setup Target Group
  vpc_id                = local.vpc_id

  # Set listeners
  alb_fa_listener_count = 1
  ra_listener_count     = 1
#  certificate_arn       =  # Add your certificate arn here
  
}