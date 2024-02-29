# Security Group for the Application Load Balancer
module "alb_security_group" {
  source = "../modules/security-group"

  name        = "alb-sg"
  description = "Security Group for the Application Load Balancer"
  vpc_id      = local.vpc_id
  ports = [
    { id = 80, cidr_blocks = ["0.0.0.0/0"], source = null },
    { id = 443, cidr_blocks = ["0.0.0.0/0"], source = null }
  ]
}

# Security Group for the container Server
module "container_security_group" {
  source = "../modules/security-group"

  name        = "container-sg"
  description = "Security Group for the container server"
  vpc_id      = local.vpc_id
  ports = [
    { id = 80, cidr_blocks = null, source = [module.alb_security_group.id] },
    { id = 443, cidr_blocks = null, source = [module.alb_security_group.id] }
  ]
}
