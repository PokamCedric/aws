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

output "tags" {
  description = "Additional tags for the security-group"
  value       = {}
}

output "id" {
  description = "Security-group id"
  value       = aws_security_group.sg.id
}
