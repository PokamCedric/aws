
output "tags" {
  value       = {}
  description = "Tags for the instance"
}

output "volume_size" {
  value       = 8
  description = "root block volume size"
}

output "ami_id" {
  value       = null
  description = "ami-id"
}

output "instance_type" {
  value       = "t2.micro"
  description = "instance type"
}

output "key_name" {
  value       = null
  description = "instance key pair name"
}

output "user_data_path" {
  value       = null
  description = "Path of user data file"
}

output "security_group_ids" {
  value       = []
  description = "network interfaces"
}

output "subnet_id" {
  value       = var.subnet_id
  description = "Subnet id"
}

output "iam_instance_profile" {
  value       = var.iam_instance_profile
  description = "instance profile name"
}
