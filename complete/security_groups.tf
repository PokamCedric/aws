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

# Security Group for the Bastion Host
module "bh_security_group" {
  source = "../modules/security-group"

  name        = "bh-sg"
  description = "Security Group for the Bastion Host"
  vpc_id      = local.vpc_id
  ports       = [{ id = 22, cidr_blocks = ["192.168.2.144/32"], source = null }]
}

# Security Group for the Web Server
module "web_security_group" {
  source = "../modules/security-group"

  name        = "Webserver-sg"
  description = "Security Group for the Web Server"
  vpc_id      = local.vpc_id
  ports = [
    { id = 80, cidr_blocks = null, source = [module.alb_security_group.id] },
    { id = 443, cidr_blocks = null, source = [module.alb_security_group.id] },
    { id = 22, cidr_blocks = null, source = [module.bh_security_group.id] }
  ]
}

# Security Group for the Database Server
module "db_security_group" {
  source = "../modules/security-group"

  name        = "db-sg"
  description = "Security Group for the Database Server"
  vpc_id      = local.vpc_id
  ports       = [{ id = 3306, cidr_blocks = null, source = [module.web_security_group.id] }]
}