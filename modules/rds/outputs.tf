################################################################################
# Subnet Group
################################################################################
output "subnet_group_name" {
  value       = "database-subnets"
  description = "Name of the database subnets"
}

output "subnet_group_description" {
  value       = "Subnets for the Database instance"
  description = "Database subnet group description"
}

output "subnet_ids" {
  value       = []
  description = "List of the database subnets ids"
}

output "subnet_group_tags" {
  value = {
    Name = "database-subnets"
  }
  description = "Database subnet group tags"
}

################################################################################
# DB Instance
################################################################################
output "security_group_ids" {
  value       = []
  description = "Database instance security group ids"
}

output "availability_zone" {
  value       = null
  description = "Database instance availability zone"
}

output "db_name" {
  value       = "application-db"
  description = "Database instance Name"
}

output "storage" {
  value       = 10
  description = "Database instance storage"
}

output "multi_az" {
  value       = false
  description = "Database instance standby"
}

output "instance_class" {
  value       = "db.t2.micro"
  description = "Database instance class"
}

output "instance_identifier" {
  value       = null
  description = "Database instance identifier"
}

output "engine" {
  value       = "mysql"
  description = "Database instance engine"
}

output "engine_version" {
  value       = "8.0.31"
  description = "Database instance engine version"
}

################################################################################
# Snapshot
################################################################################
output "snapshot_identifier" {
  value       = "test-snapshot"
  description = "Snapshot identifier"
}
