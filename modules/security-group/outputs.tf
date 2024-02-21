output "vpc_id" {
  description = "VPC id"
  value       = null
}

output "name" {
  description = "Security Group name"
  value       = "sg"
}

output "description" {
  description = "Security Group description"
  value       = "Allow traffic on the given ports"
}

output "ports" {
  description = "Ports to allow traffic"
  value       = []
}

output "source" {
  description = "inbound sources"
  value       = ["0.0.0.0/0"]
}

output "tags" {
  description = "Additional tags for the security-group"
  value       = {}
}

output "id" {
  description = "Security-group id"
  value       = try(aws_security_group.this.id)
}
