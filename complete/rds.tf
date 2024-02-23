# Get the subnets where the tag "Name" contains "private-db"
locals {
  db_subnets = toset([for subnet in module.network.out_private_subnets : subnet.id if strcontains(subnet.tags["Name"], "private-db")])
}

module "rds" {
  source = "../modules/rds"

  subnet_ids          = local.db_subnets
  security_group_ids  = [module.db_security_group.id]
  availability_zone   = module.network.azs_names[1] # second az for the master
  instance_identifier = "dev-rds-db"
  engine_version      = "5.7.36"
  username            = "admin"
  password            = "admin"
  storage             = 20
}
