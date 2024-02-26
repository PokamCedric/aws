
################################################################################
# IAM
################################################################################
output "role" {
  value       = var.role
  description = "iam role"
}

output "policy" {
  value       = var.policy
  description = "iam policy"
}

output "instance_profile" {
  value       = var.instance_profile
  description = "instance profile name"
}
