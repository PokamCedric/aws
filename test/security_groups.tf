# Security Group for the Application Load Balancer
module "alb_security_group" {
  source = "../modules/sg"
  
  name = "alb-sg"
  description = "Security Group for the Application Load Balancer"
  vpc_id = module.network.vpc_id
  ports = var.alb_sg_ports

}

# Security Group for the Bastion Host
module "bh_security_group" {
  source = "../modules/sg"
  
  name = "bh-sg"
  description = "Security Group for the Bastion Host"
  vpc_id = module.network.vpc_id
  ports = var.bh_sg_ports

}

# Security Group for the Web Server
module "web_security_group" {
  source = "../modules/sg"
  
  name = "Webserver-sg"
  description = "Security Group for the Web Server"
  vpc_id = module.network.vpc_id
  ports = var.web_sg_ports

}

# Security Group for the Database Server
module "db_security_group" {
  source = "../modules/sg"
  
  name = "db-sg"
  description = "Security Group for the Database Server"
  vpc_id = module.network.vpc_id
  ports = var.db_sg_ports

}