# create database subnet group
# terraform aws db subnet group
resource "aws_db_subnet_group" "this" {
  name        = var.subnet_group_name
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description

  tags = var.subnet_group_tags
}

