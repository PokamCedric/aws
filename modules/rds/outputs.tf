################################################################################
# Subnet Group
################################################################################
output "subnet_group_name" {
  value       = var.subnet_group_name
  description = "Name of the database subnets"
}

output "subnet_group_description" {
  value       = var.subnet_group_description
  description = "Database subnet group description"
}

output "subnet_ids" {
  value       = var.subnet_ids
  description = "List of the database subnets ids"
}

output "subnet_group_tags" {
  value       = var.subnet_group_tags
  description = "Database subnet group tags"
}

################################################################################
# DB Instance
################################################################################
output "security_group_ids" {
  value       = var.security_group_ids
  description = "Database instance security group ids"
}

output "availability_zone" {
  value       = var.availability_zone
  description = "Database instance availability zone"
}

output "db_name" {
  value       = var.db_name
  description = "Database instance Name"
}

output "username" {
  value       = var.username
  description = "Database instance username"
}

output "password" {
  value       = var.password
  description = "Database instance password"
}

output "storage" {
  value       = var.storage
  description = "Database instance storage"
}

output "multi_az" {
  value       = var.multi_az
  description = "Database instance standby"
}

output "instance_class" {
  value       = var.instance_class
  description = "Database instance class"
}

output "instance_identifier" {
  value       = var.instance_identifier
  description = "Database instance identifier"
}

output "engine" {
  value       = var.engine
  description = "Database instance engine"
}

output "engine_version" {
  value       = var.engine_version
  description = "Database instance engine version"
}

################################################################################
# Snapshot
################################################################################
output "snapshot_identifier" {
  value       = var.snapshot_identifier
  description = "Snapshot identifier"
}
