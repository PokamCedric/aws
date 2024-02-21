output "region" {
  description = "Region we need to deploy the infrastructure"
  value       = null
}

output "vpc_id" {
  description = "VPC id"
  value       = null
}

output "ami_id" {
  description = "Launch template ami-id"
  value       = null
}

output "subnet_ids" {
  description = "List of the subnets ids"
  value       = []
}

output "user_data_path" {
  description = "Path of user data file"
  value       = null
}


output "sg_ids" {
  description = "Launch Template security-group ids"
  value       = []
}
