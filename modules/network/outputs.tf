################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.this.id, null)
}

output "vpc_tags" {
  description = "The Tags of the VPC"
  value       = var.vpc_tags
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.this.cidr_block, null)
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = try(aws_vpc.this.instance_tenancy, null)
}

output "azs_names" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.azs_names
}

output "azs_count" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.azs_count
}

output "enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(aws_vpc.this.enable_dns_support, null)
}

output "enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(aws_vpc.this.enable_dns_hostnames, null)
}

################################################################################
# Publiс Subnets
################################################################################
output "public_subnets" {
  description = "List of public subnets"
  value       = var.public_subnets
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `true`"
  value       = true
}

################################################################################
# Private Subnets
################################################################################
output "private_subnets" {
  description = "List of private subnets"
  value       = var.private_subnets
}


output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  value       = false
}

################################################################################
# IGW
################################################################################
output "igw_tags" {
  value       = var.igw_tags
  description = "IGW tags"
}
